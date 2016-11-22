//
//  Concat.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 3/21/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation


class ConcatSink<S: Sequence, O: ObserverType>
    : TailRecursiveSink<S, O>
    , ObserverType where S.Iterator.Element : ObservableConvertibleType, S.Iterator.Element.E == O.E {
    typealias Element = O.E
    
<<<<<<< HEAD
    override init(observer: O, cancel: Cancelable) {
        super.init(observer: observer, cancel: cancel)
=======
    override init(observer: O) {
        super.init(observer: observer)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
    func on(_ event: Event<Element>){
        switch event {
        case .next:
            forwardOn(event)
        case .error:
            forwardOn(event)
            dispose()
        case .completed:
            schedule(.moveNext)
        }
    }

    override func subscribeToNext(_ source: Observable<E>) -> Disposable {
        return source.subscribe(self)
    }
    
    override func extract(_ observable: Observable<E>) -> SequenceGenerator? {
        if let source = observable as? Concat<S> {
            return (source._sources.makeIterator(), source._count)
        }
        else {
            return nil
        }
    }
}

class Concat<S: Sequence> : Producer<S.Iterator.Element.E> where S.Iterator.Element : ObservableConvertibleType {
    typealias Element = S.Iterator.Element.E
    
    fileprivate let _sources: S
    fileprivate let _count: IntMax?

    init(sources: S, count: IntMax?) {
        _sources = sources
        _count = count
    }
    
<<<<<<< HEAD
    override func run<O: ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == Element {
        let sink = ConcatSink<S, O>(observer: observer, cancel: cancel)
        let subscription = sink.run((_sources.makeIterator(), _count))
        return (sink: sink, subscription: subscription)
=======
    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == Element {
        let sink = ConcatSink<S, O>(observer: observer)
        sink.disposable = sink.run((_sources.makeIterator(), _count))
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
