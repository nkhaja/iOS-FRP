//
//  Filter.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 2/17/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class FilterSink<O : ObserverType>: Sink<O>, ObserverType {
    typealias Predicate = (Element) throws -> Bool
    typealias Element = O.E
    
    private let _predicate: Predicate
    
<<<<<<< HEAD
    init(predicate: @escaping Predicate, observer: O, cancel: Cancelable) {
        _predicate = predicate
        super.init(observer: observer, cancel: cancel)
=======
    init(predicate: @escaping Predicate, observer: O) {
        _predicate = predicate
        super.init(observer: observer)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
    func on(_ event: Event<Element>) {
        switch event {
            case .next(let value):
                do {
                    let satisfies = try _predicate(value)
                    if satisfies {
                        forwardOn(.next(value))
                    }
                }
                catch let e {
                    forwardOn(.error(e))
                    dispose()
                }
            case .completed, .error:
                forwardOn(event)
                dispose()
        }
    }
}

class Filter<Element> : Producer<Element> {
    typealias Predicate = (Element) throws -> Bool
    
    private let _source: Observable<Element>
    private let _predicate: Predicate
    
    init(source: Observable<Element>, predicate: @escaping Predicate) {
        _source = source
        _predicate = predicate
    }
    
<<<<<<< HEAD
    override func run<O: ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == Element {
        let sink = FilterSink(predicate: _predicate, observer: observer, cancel: cancel)
        let subscription = _source.subscribe(sink)
        return (sink: sink, subscription: subscription)
=======
    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == Element {
        let sink = FilterSink(predicate: _predicate, observer: observer)
        sink.disposable = _source.subscribe(sink)
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
