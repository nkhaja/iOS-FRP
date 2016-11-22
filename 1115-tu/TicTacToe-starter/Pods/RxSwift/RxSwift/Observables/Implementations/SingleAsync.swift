//
//  SingleAsync.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Junior B. on 09/11/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class SingleAsyncSink<ElementType, O: ObserverType> : Sink<O>, ObserverType where O.E == ElementType {
    typealias Parent = SingleAsync<ElementType>
    typealias E = ElementType
    
    private let _parent: Parent
    private var _seenValue: Bool = false
    
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
    
    func on(_ event: Event<E>) {
        switch event {
        case .next(let value):
            do {
                let forward = try _parent._predicate?(value) ?? true
                if !forward {
                    return
                }
            }
            catch let error {
                forwardOn(.error(error as Swift.Error))
                dispose()
                return
            }

            if _seenValue == false {
                _seenValue = true
                forwardOn(.next(value))
            } else {
                forwardOn(.error(RxError.moreThanOneElement))
                dispose()
            }
            
        case .error:
            forwardOn(event)
            dispose()
        case .completed:
            if (!_seenValue) {
                forwardOn(.error(RxError.noElements))
            } else {
                forwardOn(.completed)
            }
            dispose()
        }
    }
}

class SingleAsync<Element>: Producer<Element> {
    typealias Predicate = (Element) throws -> Bool
    
    fileprivate let _source: Observable<Element>
    fileprivate let _predicate: Predicate?
    
    init(source: Observable<Element>, predicate: Predicate? = nil) {
        _source = source
        _predicate = predicate
    }
    
<<<<<<< HEAD
    override func run<O : ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == Element {
        let sink = SingleAsyncSink(parent: self, observer: observer, cancel: cancel)
        let subscription = _source.subscribe(sink)
        return (sink: sink, subscription: subscription)
=======
    override func run<O : ObserverType>(_ observer: O) -> Disposable where O.E == Element {
        let sink = SingleAsyncSink(parent: self, observer: observer)
        sink.disposable = _source.subscribe(sink)
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
