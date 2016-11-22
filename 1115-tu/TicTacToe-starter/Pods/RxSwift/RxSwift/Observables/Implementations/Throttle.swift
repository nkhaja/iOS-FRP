//
//  Throttle.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 3/22/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class ThrottleSink<O: ObserverType>
    : Sink<O>
    , ObserverType
    , LockOwnerType
    , SynchronizedOnType {
    typealias Element = O.E
    typealias ParentType = Throttle<Element>
    
    private let _parent: ParentType
    
    let _lock = NSRecursiveLock()
    
    // state
    private var _lastUnsentElement: Element? = nil
    private var _lastSentTime: Date? = nil
    private var _completed: Bool = false

    let cancellable = SerialDisposable()
    
<<<<<<< HEAD
    init(parent: ParentType, observer: O, cancel: Cancelable) {
        _parent = parent
        
        super.init(observer: observer, cancel: cancel)
=======
    init(parent: ParentType, observer: O) {
        _parent = parent
        
        super.init(observer: observer)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
    func run() -> Disposable {
        let subscription = _parent._source.subscribe(self)
        
        return Disposables.create(subscription, cancellable)
    }

    func on(_ event: Event<Element>) {
        synchronizedOn(event)
    }

    func _synchronized_on(_ event: Event<Element>) {
        switch event {
        case .next(let element):
            let now = _parent._scheduler.now

            let timeIntervalSinceLast: RxTimeInterval

            if let lastSendingTime = _lastSentTime {
                timeIntervalSinceLast = now.timeIntervalSince(lastSendingTime)
            }
            else {
                timeIntervalSinceLast = _parent._dueTime
            }

            let couldSendNow = timeIntervalSinceLast >= _parent._dueTime

            if couldSendNow {
                self.sendNow(element: element)
                return
            }

            if !_parent._latest {
                return
            }

            let isThereAlreadyInFlightRequest = _lastUnsentElement != nil
            
            _lastUnsentElement = element

            if isThereAlreadyInFlightRequest {
                return
            }

            let scheduler = _parent._scheduler
            let dueTime = _parent._dueTime

            let d = SingleAssignmentDisposable()
            self.cancellable.disposable = d

<<<<<<< HEAD
            d.setDisposable(scheduler.scheduleRelative(0, dueTime: dueTime - timeIntervalSinceLast, action: self.propagate))
=======
            d.disposable = scheduler.scheduleRelative(0, dueTime: dueTime - timeIntervalSinceLast, action: self.propagate)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        case .error:
            _lastUnsentElement = nil
            forwardOn(event)
            dispose()
        case .completed:
            if let _ = _lastUnsentElement {
                _completed = true
            }
            else {
                forwardOn(.completed)
                dispose()
            }
        }
    }

    private func sendNow(element: Element) {
        _lastUnsentElement = nil
        self.forwardOn(.next(element))
        // in case element processing takes a while, this should give some more room
        _lastSentTime = _parent._scheduler.now
    }
    
    func propagate(_: Int) -> Disposable {
        _lock.lock(); defer { _lock.unlock() } // {
            if let lastUnsentElement = _lastUnsentElement {
                sendNow(element: lastUnsentElement)
            }

            if _completed {
                forwardOn(.completed)
                dispose()
            }
        // }
        return Disposables.create()
    }
}

class Throttle<Element> : Producer<Element> {
    
    fileprivate let _source: Observable<Element>
    fileprivate let _dueTime: RxTimeInterval
    fileprivate let _latest: Bool
    fileprivate let _scheduler: SchedulerType

    init(source: Observable<Element>, dueTime: RxTimeInterval, latest: Bool, scheduler: SchedulerType) {
        _source = source
        _dueTime = dueTime
        _latest = latest
        _scheduler = scheduler
    }
    
<<<<<<< HEAD
    override func run<O: ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == Element {
        let sink = ThrottleSink(parent: self, observer: observer, cancel: cancel)
        let subscription = sink.run()
        return (sink: sink, subscription: subscription)
=======
    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == Element {
        let sink = ThrottleSink(parent: self, observer: observer)
        sink.disposable = sink.run()
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
}
