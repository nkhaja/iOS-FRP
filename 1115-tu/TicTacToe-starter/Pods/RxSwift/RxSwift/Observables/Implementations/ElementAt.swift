//
//  ElementAt.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Junior B. on 21/10/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation


class ElementAtSink<SourceType, O: ObserverType> : Sink<O>, ObserverType where O.E == SourceType {
    typealias Parent = ElementAt<SourceType>
    
    let _parent: Parent
    var _i: Int
    
<<<<<<< HEAD
    init(parent: Parent, observer: O, cancel: Cancelable) {
        _parent = parent
        _i = parent._index
        
        super.init(observer: observer, cancel: cancel)
=======
    init(parent: Parent, observer: O) {
        _parent = parent
        _i = parent._index
        
        super.init(observer: observer)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
    func on(_ event: Event<SourceType>) {
        switch event {
        case .next(_):

            if (_i == 0) {
                forwardOn(event)
                forwardOn(.completed)
                self.dispose()
            }
            
            do {
                let _ = try decrementChecked(&_i)
            } catch(let e) {
                forwardOn(.error(e))
                dispose()
                return
            }
            
        case .error(let e):
            forwardOn(.error(e))
            self.dispose()
        case .completed:
            if (_parent._throwOnEmpty) {
                forwardOn(.error(RxError.argumentOutOfRange))
            } else {
                forwardOn(.completed)
            }
            
            self.dispose()
        }
    }
}

class ElementAt<SourceType> : Producer<SourceType> {
    
    let _source: Observable<SourceType>
    let _throwOnEmpty: Bool
    let _index: Int
    
    init(source: Observable<SourceType>, index: Int, throwOnEmpty: Bool) {
        if index < 0 {
            rxFatalError("index can't be negative")
        }

        self._source = source
        self._index = index
        self._throwOnEmpty = throwOnEmpty
    }
    
<<<<<<< HEAD
    override func run<O: ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == SourceType {
        let sink = ElementAtSink(parent: self, observer: observer, cancel: cancel)
        let subscription = _source.subscribeSafe(sink)
        return (sink: sink, subscription: subscription)
=======
    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == SourceType {
        let sink = ElementAtSink(parent: self, observer: observer)
        sink.disposable = _source.subscribeSafe(sink)
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
