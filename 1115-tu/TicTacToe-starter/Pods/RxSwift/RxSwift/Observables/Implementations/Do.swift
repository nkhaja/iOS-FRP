//
//  Do.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 2/21/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class DoSink<O: ObserverType> : Sink<O>, ObserverType {
    typealias Element = O.E
    typealias Parent = Do<Element>
    
    private let _parent: Parent
    
<<<<<<< HEAD
    init(parent: Parent, observer: O, cancel: Cancelable) {
        _parent = parent
        super.init(observer: observer, cancel: cancel)
=======
    init(parent: Parent, observer: O) {
        _parent = parent
        super.init(observer: observer)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
    func on(_ event: Event<Element>) {
        do {
            try _parent._eventHandler(event)
            forwardOn(event)
            if event.isStopEvent {
                dispose()
            }
        }
        catch let error {
            forwardOn(.error(error))
            dispose()
        }
    }
}

class Do<Element> : Producer<Element> {
    typealias EventHandler = (Event<Element>) throws -> Void
    
    fileprivate let _source: Observable<Element>
    fileprivate let _eventHandler: EventHandler
    fileprivate let _onSubscribe: (() -> ())?
    fileprivate let _onDispose: (() -> ())?
    
    init(source: Observable<Element>, eventHandler: @escaping EventHandler, onSubscribe: (() -> ())?, onDispose: (() -> ())?) {
        _source = source
        _eventHandler = eventHandler
        _onSubscribe = onSubscribe
        _onDispose = onDispose
    }
    
<<<<<<< HEAD
    override func run<O: ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == Element {
        _onSubscribe?()
        let sink = DoSink(parent: self, observer: observer, cancel: cancel)
        let subscription = _source.subscribe(sink)
        let onDispose = _onDispose
        let allSubscriptions = Disposables.create {
            subscription.dispose()
            onDispose?()
        }
        return (sink: sink, subscription: allSubscriptions)
=======
    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == Element {
        _onSubscribe?()
        let sink = DoSink(parent: self, observer: observer)
        let subscription = _source.subscribe(sink)
        let onDispose = _onDispose
        sink.disposable = Disposables.create {
            subscription.dispose()
            onDispose?()
        }
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
