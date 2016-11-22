//
//  Debunce.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 9/11/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

import Foundation

class DebounceSink<O: ObserverType>
    : Sink<O>
    , ObserverType
    , LockOwnerType
    , SynchronizedOnType {
    typealias Element = O.E
    typealias ParentType = Debounce<Element>

    private let _parent: ParentType

    let _lock = NSRecursiveLock()

    // state
    private var _id = 0 as UInt64
    private var _value: Element? = nil

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
            _id = _id &+ 1
            let currentId = _id
            _value = element


            let scheduler = _parent._scheduler
            let dueTime = _parent._dueTime

            let d = SingleAssignmentDisposable()
            self.cancellable.disposable = d
<<<<<<< HEAD
            d.setDisposable(scheduler.scheduleRelative(currentId, dueTime: dueTime, action: self.propagate))
=======
            d.disposable = scheduler.scheduleRelative(currentId, dueTime: dueTime, action: self.propagate)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        case .error:
            _value = nil
            forwardOn(event)
            dispose()
        case .completed:
            if let value = _value {
                _value = nil
                forwardOn(.next(value))
            }
            forwardOn(.completed)
            dispose()
        }
    }

    func propagate(_ currentId: UInt64) -> Disposable {
        _lock.lock(); defer { _lock.unlock() } // {
        let originalValue = _value

        if let value = originalValue, _id == currentId {
            _value = nil
            forwardOn(.next(value))
        }
        // }
        return Disposables.create()
    }
}

class Debounce<Element> : Producer<Element> {

    fileprivate let _source: Observable<Element>
    fileprivate let _dueTime: RxTimeInterval
    fileprivate let _scheduler: SchedulerType

    init(source: Observable<Element>, dueTime: RxTimeInterval, scheduler: SchedulerType) {
        _source = source
        _dueTime = dueTime
        _scheduler = scheduler
    }

<<<<<<< HEAD
    override func run<O: ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == Element {
        let sink = DebounceSink(parent: self, observer: observer, cancel: cancel)
        let subscription = sink.run()
        return (sink: sink, subscription: subscription)
=======
    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == Element {
        let sink = DebounceSink(parent: self, observer: observer)
        sink.disposable = sink.run()
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
}
