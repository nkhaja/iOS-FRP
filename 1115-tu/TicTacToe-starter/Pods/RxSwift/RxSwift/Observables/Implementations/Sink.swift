//
//  Sink.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 2/19/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
class Sink<O : ObserverType> : Disposable {
    fileprivate let _observer: O
    fileprivate let _cancel: Cancelable
    fileprivate var _disposed: Bool

    init(observer: O, cancel: Cancelable) {
#if TRACE_RESOURCES
        let _ = Resources.incrementTotal()
#endif
        _observer = observer
        _cancel = cancel
        _disposed = false
    }
    
    final func forwardOn(_ event: Event<O.E>) {
        if _disposed {
=======
class Sink<O : ObserverType> : SingleAssignmentDisposable {
    fileprivate let _observer: O

    init(observer: O) {
#if TRACE_RESOURCES
        let _ = AtomicIncrement(&resourceCount)
#endif
        _observer = observer
    }
    
    final func forwardOn(_ event: Event<O.E>) {
        if isDisposed {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            return
        }
        _observer.on(event)
    }
    
    final func forwarder() -> SinkForward<O> {
        return SinkForward(forward: self)
    }

<<<<<<< HEAD
    var disposed: Bool {
        return _disposed
    }

    func dispose() {
        _disposed = true
        _cancel.dispose()
    }

    deinit {
#if TRACE_RESOURCES
       let _ =  Resources.decrementTotal()
=======
    deinit {
#if TRACE_RESOURCES
       let _ =  AtomicDecrement(&resourceCount)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
#endif
    }
}

class SinkForward<O: ObserverType>: ObserverType {
    typealias E = O.E
    
    private let _forward: Sink<O>
    
    init(forward: Sink<O>) {
        _forward = forward
    }
    
    func on(_ event: Event<E>) {
        switch event {
        case .next:
            _forward._observer.on(event)
        case .error, .completed:
            _forward._observer.on(event)
<<<<<<< HEAD
            _forward._cancel.dispose()
=======
            _forward.dispose()
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        }
    }
}
