//
//  Catch.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 4/19/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

// catch with callback

class CatchSinkProxy<O: ObserverType> : ObserverType {
    typealias E = O.E
    typealias Parent = CatchSink<O>
    
    private let _parent: Parent
    
    init(parent: Parent) {
        _parent = parent
    }
    
    func on(_ event: Event<E>) {
        _parent.forwardOn(event)
        
        switch event {
        case .next:
            break
        case .error, .completed:
            _parent.dispose()
        }
    }
}

class CatchSink<O: ObserverType> : Sink<O>, ObserverType {
    typealias E = O.E
    typealias Parent = Catch<E>
    
    private let _parent: Parent
    private let _subscription = SerialDisposable()
    
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
        let d1 = SingleAssignmentDisposable()
        _subscription.disposable = d1
<<<<<<< HEAD
        d1.setDisposable(_parent._source.subscribe(self))
=======
        d1.disposable = _parent._source.subscribe(self)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5

        return _subscription
    }
    
    func on(_ event: Event<E>) {
        switch event {
        case .next:
            forwardOn(event)
        case .completed:
            forwardOn(event)
            dispose()
        case .error(let error):
            do {
                let catchSequence = try _parent._handler(error)

                let observer = CatchSinkProxy(parent: self)
                
                _subscription.disposable = catchSequence.subscribe(observer)
            }
            catch let e {
                forwardOn(.error(e))
                dispose()
            }
        }
    }
}

class Catch<Element> : Producer<Element> {
    typealias Handler = (Swift.Error) throws -> Observable<Element>
    
    fileprivate let _source: Observable<Element>
    fileprivate let _handler: Handler
    
    init(source: Observable<Element>, handler: @escaping Handler) {
        _source = source
        _handler = handler
    }
    
<<<<<<< HEAD
    override func run<O: ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == Element {
        let sink = CatchSink(parent: self, observer: observer, cancel: cancel)
        let subscription = sink.run()
        return (sink: sink, subscription: subscription)
=======
    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == Element {
        let sink = CatchSink(parent: self, observer: observer)
        sink.disposable = sink.run()
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}

// catch enumerable

class CatchSequenceSink<S: Sequence, O: ObserverType>
    : TailRecursiveSink<S, O>
    , ObserverType where S.Iterator.Element : ObservableConvertibleType, S.Iterator.Element.E == O.E {
    typealias Element = O.E
    typealias Parent = CatchSequence<S>
    
    private var _lastError: Swift.Error?
    
<<<<<<< HEAD
    override init(observer: O, cancel: Cancelable) {
        super.init(observer: observer, cancel: cancel)
=======
    override init(observer: O) {
        super.init(observer: observer)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
    func on(_ event: Event<Element>) {
        switch event {
        case .next:
            forwardOn(event)
        case .error(let error):
            _lastError = error
            schedule(.moveNext)
        case .completed:
            forwardOn(event)
            dispose()
        }
    }

    override func subscribeToNext(_ source: Observable<E>) -> Disposable {
        return source.subscribe(self)
    }
    
    override func done() {
        if let lastError = _lastError {
            forwardOn(.error(lastError))
        }
        else {
            forwardOn(.completed)
        }
        
        self.dispose()
    }
    
    override func extract(_ observable: Observable<Element>) -> SequenceGenerator? {
        if let onError = observable as? CatchSequence<S> {
            return (onError.sources.makeIterator(), nil)
        }
        else {
            return nil
        }
    }
}

class CatchSequence<S: Sequence> : Producer<S.Iterator.Element.E> where S.Iterator.Element : ObservableConvertibleType {
    typealias Element = S.Iterator.Element.E
    
    let sources: S
    
    init(sources: S) {
        self.sources = sources
    }
    
<<<<<<< HEAD
    override func run<O : ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == Element {
        let sink = CatchSequenceSink<S, O>(observer: observer, cancel: cancel)
        let subscription = sink.run((self.sources.makeIterator(), nil))
        return (sink: sink, subscription: subscription)
=======
    override func run<O : ObserverType>(_ observer: O) -> Disposable where O.E == Element {
        let sink = CatchSequenceSink<S, O>(observer: observer)
        sink.disposable = sink.run((self.sources.makeIterator(), nil))
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
