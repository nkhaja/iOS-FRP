//
//  TakeLast.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Tomi Koskinen on 25/10/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation


class TakeLastSink<ElementType, O: ObserverType> : Sink<O>, ObserverType where O.E == ElementType {
    typealias Parent = TakeLast<ElementType>
    typealias E = ElementType
    
    private let _parent: Parent
    
    private var _elements: Queue<ElementType>
    
<<<<<<< HEAD
    init(parent: Parent, observer: O, cancel: Cancelable) {
        _parent = parent
        _elements = Queue<ElementType>(capacity: parent._count + 1)
        super.init(observer: observer, cancel: cancel)
=======
    init(parent: Parent, observer: O) {
        _parent = parent
        _elements = Queue<ElementType>(capacity: parent._count + 1)
        super.init(observer: observer)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
    func on(_ event: Event<E>) {
        switch event {
        case .next(let value):
            _elements.enqueue(value)
            if _elements.count > self._parent._count {
                let _ = _elements.dequeue()
            }
        case .error:
            forwardOn(event)
            dispose()
        case .completed:
            for e in _elements {
                forwardOn(.next(e))
            }
            forwardOn(.completed)
            dispose()
        }
    }
}

class TakeLast<Element>: Producer<Element> {
    fileprivate let _source: Observable<Element>
    fileprivate let _count: Int
    
    init(source: Observable<Element>, count: Int) {
        if count < 0 {
            rxFatalError("count can't be negative")
        }
        _source = source
        _count = count
    }
    
<<<<<<< HEAD
    override func run<O : ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == Element {
        let sink = TakeLastSink(parent: self, observer: observer, cancel: cancel)
        let subscription = _source.subscribe(sink)
        return (sink: sink, subscription: subscription)
=======
    override func run<O : ObserverType>(_ observer: O) -> Disposable where O.E == Element {
        let sink = TakeLastSink(parent: self, observer: observer)
        sink.disposable = _source.subscribe(sink)
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
