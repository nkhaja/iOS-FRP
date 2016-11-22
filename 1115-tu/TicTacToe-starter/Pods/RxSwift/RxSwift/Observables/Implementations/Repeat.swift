//
//  Repeat.swift
<<<<<<< HEAD
//  RxSwift
=======
//  RxExample
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 9/13/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class RepeatElement<Element> : Producer<Element> {
    fileprivate let _element: Element
    fileprivate let _scheduler: ImmediateSchedulerType
    
    init(element: Element, scheduler: ImmediateSchedulerType) {
        _element = element
        _scheduler = scheduler
    }
    
<<<<<<< HEAD
    override func run<O : ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == Element {
        let sink = RepeatElementSink(parent: self, observer: observer, cancel: cancel)
        let subscription = sink.run()

        return (sink: sink, subscription: subscription)
=======
    override func run<O : ObserverType>(_ observer: O) -> Disposable where O.E == Element {
        let sink = RepeatElementSink(parent: self, observer: observer)
        sink.disposable = sink.run()

        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}

class RepeatElementSink<O: ObserverType> : Sink<O> {
    typealias Parent = RepeatElement<O.E>
    
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
    
    func run() -> Disposable {
        return _parent._scheduler.scheduleRecursive(_parent._element) { e, recurse in
            self.forwardOn(.next(e))
            recurse(e)
        }
    }
}
