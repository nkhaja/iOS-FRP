//
//  ToArray.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Junior B. on 20/10/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class ToArraySink<SourceType, O: ObserverType> : Sink<O>, ObserverType where O.E == [SourceType] {
    typealias Parent = ToArray<SourceType>
    
    let _parent: Parent
    var _list = Array<SourceType>()
    
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
    
    func on(_ event: Event<SourceType>) {
        switch event {
        case .next(let value):
            self._list.append(value)
        case .error(let e):
            forwardOn(.error(e))
            self.dispose()
        case .completed:
            forwardOn(.next(_list))
            forwardOn(.completed)
            self.dispose()
        }
    }
}

class ToArray<SourceType> : Producer<[SourceType]> {
    let _source: Observable<SourceType>

    init(source: Observable<SourceType>) {
        _source = source
    }
    
<<<<<<< HEAD
    override func run<O: ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == [SourceType] {
        let sink = ToArraySink(parent: self, observer: observer, cancel: cancel)
        let subscription = _source.subscribe(sink)
        return (sink: sink, subscription: subscription)
=======
    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == [SourceType] {
        let sink = ToArraySink(parent: self, observer: observer)
        sink.disposable = _source.subscribe(sink)
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
