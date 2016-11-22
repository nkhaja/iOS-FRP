//
//  SubscribeOn.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 6/14/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class SubscribeOnSink<Ob: ObservableType, O: ObserverType> : Sink<O>, ObserverType where Ob.E == O.E {
    typealias Element = O.E
    typealias Parent = SubscribeOn<Ob>
    
    let parent: Parent
    
<<<<<<< HEAD
    init(parent: Parent, observer: O, cancel: Cancelable) {
        self.parent = parent
        super.init(observer: observer, cancel: cancel)
=======
    init(parent: Parent, observer: O) {
        self.parent = parent
        super.init(observer: observer)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
    func on(_ event: Event<Element>) {
        forwardOn(event)
        
        if event.isStopEvent {
            self.dispose()
        }
    }
    
    func run() -> Disposable {
        let disposeEverything = SerialDisposable()
        let cancelSchedule = SingleAssignmentDisposable()
        
        disposeEverything.disposable = cancelSchedule
        
<<<<<<< HEAD
        let disposeSchedule = parent.scheduler.schedule(()) { (_) -> Disposable in
=======
        cancelSchedule.disposable = parent.scheduler.schedule(()) { (_) -> Disposable in
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            let subscription = self.parent.source.subscribe(self)
            disposeEverything.disposable = ScheduledDisposable(scheduler: self.parent.scheduler, disposable: subscription)
            return Disposables.create()
        }
<<<<<<< HEAD

        cancelSchedule.setDisposable(disposeSchedule)
=======
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    
        return disposeEverything
    }
}

class SubscribeOn<Ob: ObservableType> : Producer<Ob.E> {
    let source: Ob
    let scheduler: ImmediateSchedulerType
    
    init(source: Ob, scheduler: ImmediateSchedulerType) {
        self.source = source
        self.scheduler = scheduler
    }
    
<<<<<<< HEAD
    override func run<O : ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == Ob.E {
        let sink = SubscribeOnSink(parent: self, observer: observer, cancel: cancel)
        let subscription = sink.run()
        return (sink: sink, subscription: subscription)
=======
    override func run<O : ObserverType>(_ observer: O) -> Disposable where O.E == Ob.E {
        let sink = SubscribeOnSink(parent: self, observer: observer)
        sink.disposable = sink.run()
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
