//
//  ObserveOnSerialDispatchQueue.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 5/31/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

#if TRACE_RESOURCES
<<<<<<< HEAD
    fileprivate var _numberOfSerialDispatchQueueObservables: AtomicInt = 0
    extension Resources {
        /**
        Counts number of `SerialDispatchQueueObservables`.

        Purposed for unit tests.
        */
        public static var numberOfSerialDispatchQueueObservables: Int32 {
            return _numberOfSerialDispatchQueueObservables.valueSnapshot()
        }
    }
=======
/**
Counts number of `SerialDispatchQueueObservables`.

Purposed for unit tests.
*/
public var numberOfSerialDispatchQueueObservables: AtomicInt = 0
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
#endif

class ObserveOnSerialDispatchQueueSink<O: ObserverType> : ObserverBase<O.E> {
    let scheduler: SerialDispatchQueueScheduler
    let observer: O
    
<<<<<<< HEAD
    let cancel: Cancelable

    var cachedScheduleLambda: ((ObserveOnSerialDispatchQueueSink<O>, Event<E>) -> Disposable)!

    init(scheduler: SerialDispatchQueueScheduler, observer: O, cancel: Cancelable) {
        self.scheduler = scheduler
        self.observer = observer
        self.cancel = cancel
=======
    let subscription = SingleAssignmentDisposable()

    var cachedScheduleLambda: ((ObserveOnSerialDispatchQueueSink<O>, Event<E>) -> Disposable)!

    init(scheduler: SerialDispatchQueueScheduler, observer: O) {
        self.scheduler = scheduler
        self.observer = observer
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        super.init()

        cachedScheduleLambda = { sink, event in
            sink.observer.on(event)

            if event.isStopEvent {
                sink.dispose()
            }

            return Disposables.create()
        }
    }

    override func onCore(_ event: Event<E>) {
        let _ = self.scheduler.schedule((self, event), action: cachedScheduleLambda)
    }
   
    override func dispose() {
        super.dispose()

<<<<<<< HEAD
        cancel.dispose()
=======
        subscription.dispose()
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
    
class ObserveOnSerialDispatchQueue<E> : Producer<E> {
    let scheduler: SerialDispatchQueueScheduler
    let source: Observable<E>
    
    init(source: Observable<E>, scheduler: SerialDispatchQueueScheduler) {
        self.scheduler = scheduler
        self.source = source
        
#if TRACE_RESOURCES
<<<<<<< HEAD
        let _ = Resources.incrementTotal()
        let _ = AtomicIncrement(&_numberOfSerialDispatchQueueObservables)
#endif
    }
    
    override func run<O : ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == E {
        let sink = ObserveOnSerialDispatchQueueSink(scheduler: scheduler, observer: observer, cancel: cancel)
        let subscription = source.subscribe(sink)
        return (sink: sink, subscription: subscription)
=======
        let _ = AtomicIncrement(&resourceCount)
        let _ = AtomicIncrement(&numberOfSerialDispatchQueueObservables)
#endif
    }
    
    override func run<O : ObserverType>(_ observer: O) -> Disposable where O.E == E {
        let sink = ObserveOnSerialDispatchQueueSink(scheduler: scheduler, observer: observer)
        sink.subscription.disposable = source.subscribe(sink)
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
#if TRACE_RESOURCES
    deinit {
<<<<<<< HEAD
        let _ = Resources.decrementTotal()
        let _ = AtomicDecrement(&_numberOfSerialDispatchQueueObservables)
=======
        let _ = AtomicDecrement(&resourceCount)
        let _ = AtomicDecrement(&numberOfSerialDispatchQueueObservables)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
#endif
}
