//
//  Sample.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 5/1/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class SamplerSink<O: ObserverType, ElementType, SampleType>
    : ObserverType
    , LockOwnerType
    , SynchronizedOnType where O.E == ElementType {
    typealias E = SampleType
    
    typealias Parent = SampleSequenceSink<O, SampleType>
    
    fileprivate let _parent: Parent

    var _lock: NSRecursiveLock {
        return _parent._lock
    }
    
    init(parent: Parent) {
        _parent = parent
    }
    
    func on(_ event: Event<E>) {
        synchronizedOn(event)
    }

    func _synchronized_on(_ event: Event<E>) {
        switch event {
        case .next:
            if let element = _parent._element {
                if _parent._parent._onlyNew {
                    _parent._element = nil
                }
                
                _parent.forwardOn(.next(element))
            }

            if _parent._atEnd {
                _parent.forwardOn(.completed)
                _parent.dispose()
            }
        case .error(let e):
            _parent.forwardOn(.error(e))
            _parent.dispose()
        case .completed:
            if let element = _parent._element {
                _parent._element = nil
                _parent.forwardOn(.next(element))
            }
            if _parent._atEnd {
                _parent.forwardOn(.completed)
                _parent.dispose()
            }
        }
    }
}

class SampleSequenceSink<O: ObserverType, SampleType>
    : Sink<O>
    , ObserverType
    , LockOwnerType
    , SynchronizedOnType {
    typealias Element = O.E
    typealias Parent = Sample<Element, SampleType>
    
    fileprivate let _parent: Parent

    let _lock = NSRecursiveLock()
    
    // state
    fileprivate var _element = nil as Element?
    fileprivate var _atEnd = false
    
    fileprivate let _sourceSubscription = SingleAssignmentDisposable()
    
<<<<<<< HEAD
    init(parent: Parent, observer: O, cancel: Cancelable) {
        _parent = parent
        super.init(observer: observer, cancel: cancel)
    }
    
    func run() -> Disposable {
        _sourceSubscription.setDisposable(_parent._source.subscribe(self))
=======
    init(parent: Parent, observer: O) {
        _parent = parent
        super.init(observer: observer)
    }
    
    func run() -> Disposable {
        _sourceSubscription.disposable = _parent._source.subscribe(self)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        let samplerSubscription = _parent._sampler.subscribe(SamplerSink(parent: self))
        
        return Disposables.create(_sourceSubscription, samplerSubscription)
    }
    
    func on(_ event: Event<Element>) {
        synchronizedOn(event)
    }

    func _synchronized_on(_ event: Event<Element>) {
        switch event {
        case .next(let element):
            _element = element
        case .error:
            forwardOn(event)
            dispose()
        case .completed:
            _atEnd = true
            _sourceSubscription.dispose()
        }
    }
    
}

class Sample<Element, SampleType> : Producer<Element> {
    fileprivate let _source: Observable<Element>
    fileprivate let _sampler: Observable<SampleType>
    fileprivate let _onlyNew: Bool

    init(source: Observable<Element>, sampler: Observable<SampleType>, onlyNew: Bool) {
        _source = source
        _sampler = sampler
        _onlyNew = onlyNew
    }
    
<<<<<<< HEAD
    override func run<O: ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == Element {
        let sink = SampleSequenceSink(parent: self, observer: observer, cancel: cancel)
        let subscription = sink.run()
        return (sink: sink, subscription: subscription)
=======
    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == Element {
        let sink = SampleSequenceSink(parent: self, observer: observer)
        sink.disposable = sink.run()
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
