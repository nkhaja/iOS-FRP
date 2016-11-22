//
//  Map.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 3/15/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class MapSink<SourceType, O : ObserverType> : Sink<O>, ObserverType {
<<<<<<< HEAD
    typealias Transform = (SourceType) throws -> ResultType
=======
    typealias Selector = (SourceType) throws -> ResultType
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5

    typealias ResultType = O.E
    typealias Element = SourceType

<<<<<<< HEAD
    private let _transform: Transform
    
    init(transform: @escaping Transform, observer: O, cancel: Cancelable) {
        _transform = transform
        super.init(observer: observer, cancel: cancel)
=======
    private let _selector: Selector
    
    init(selector: @escaping Selector, observer: O) {
        _selector = selector
        super.init(observer: observer)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }

    func on(_ event: Event<SourceType>) {
        switch event {
        case .next(let element):
            do {
<<<<<<< HEAD
                let mappedElement = try _transform(element)
=======
                let mappedElement = try _selector(element)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
                forwardOn(.next(mappedElement))
            }
            catch let e {
                forwardOn(.error(e))
                dispose()
            }
        case .error(let error):
            forwardOn(.error(error))
            dispose()
        case .completed:
            forwardOn(.completed)
            dispose()
        }
    }
}

class MapWithIndexSink<SourceType, O : ObserverType> : Sink<O>, ObserverType {
    typealias Selector = (SourceType, Int) throws -> ResultType

    typealias ResultType = O.E
    typealias Element = SourceType
    typealias Parent = MapWithIndex<SourceType, ResultType>
    
    private let _selector: Selector

    private var _index = 0

<<<<<<< HEAD
    init(selector: @escaping Selector, observer: O, cancel: Cancelable) {
        _selector = selector
        super.init(observer: observer, cancel: cancel)
=======
    init(selector: @escaping Selector, observer: O) {
        _selector = selector
        super.init(observer: observer)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }

    func on(_ event: Event<SourceType>) {
        switch event {
        case .next(let element):
            do {
                let mappedElement = try _selector(element, try incrementChecked(&_index))
                forwardOn(.next(mappedElement))
            }
            catch let e {
                forwardOn(.error(e))
                dispose()
            }
        case .error(let error):
            forwardOn(.error(error))
            dispose()
        case .completed:
            forwardOn(.completed)
            dispose()
        }
    }
}

class MapWithIndex<SourceType, ResultType> : Producer<ResultType> {
    typealias Selector = (SourceType, Int) throws -> ResultType

    private let _source: Observable<SourceType>

    private let _selector: Selector

    init(source: Observable<SourceType>, selector: @escaping Selector) {
        _source = source
        _selector = selector
    }

<<<<<<< HEAD
    override func run<O: ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == ResultType {
        let sink = MapWithIndexSink(selector: _selector, observer: observer, cancel: cancel)
        let subscription = _source.subscribe(sink)
        return (sink: sink, subscription: subscription)
=======
    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == ResultType {
        let sink = MapWithIndexSink(selector: _selector, observer: observer)
        sink.disposable = _source.subscribe(sink)
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}

#if TRACE_RESOURCES
<<<<<<< HEAD
    var _numberOfMapOperators: AtomicInt = 0
    extension Resources {
        public static var numberOfMapOperators: Int32 {
            return _numberOfMapOperators.valueSnapshot()
        }
    }
#endif

class Map<SourceType, ResultType>: Producer<ResultType> {
    typealias Transform = (SourceType) throws -> ResultType

    private let _source: Observable<SourceType>

    private let _transform: Transform

    init(source: Observable<SourceType>, transform: @escaping Transform) {
        _source = source
        _transform = transform

#if TRACE_RESOURCES
        let _ = AtomicIncrement(&_numberOfMapOperators)
=======
public var numberOfMapOperators: Int32 = 0
#endif

class Map<SourceType, ResultType>: Producer<ResultType> {
    typealias Selector = (SourceType) throws -> ResultType

    private let _source: Observable<SourceType>

    private let _selector: Selector

    init(source: Observable<SourceType>, selector: @escaping Selector) {
        _source = source
        _selector = selector

#if TRACE_RESOURCES
        let _ = AtomicIncrement(&numberOfMapOperators)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
#endif
    }

    override func composeMap<R>(_ selector: @escaping (ResultType) throws -> R) -> Observable<R> {
<<<<<<< HEAD
        let originalSelector = _transform
        return Map<SourceType, R>(source: _source, transform: { (s: SourceType) throws -> R in
=======
        let originalSelector = _selector
        return Map<SourceType, R>(source: _source, selector: { (s: SourceType) throws -> R in
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            let r: ResultType = try originalSelector(s)
            return try selector(r)
        })
    }
    
<<<<<<< HEAD
    override func run<O: ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == ResultType {
        let sink = MapSink(transform: _transform, observer: observer, cancel: cancel)
        let subscription = _source.subscribe(sink)
        return (sink: sink, subscription: subscription)
=======
    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == ResultType {
        let sink = MapSink(selector: _selector, observer: observer)
        sink.disposable = _source.subscribe(sink)
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }

    #if TRACE_RESOURCES
    deinit {
<<<<<<< HEAD
        let _ = AtomicDecrement(&_numberOfMapOperators)
=======
        let _ = AtomicDecrement(&numberOfMapOperators)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    #endif
}
