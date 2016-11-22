//
//  Deferred.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 4/19/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class DeferredSink<S: ObservableType, O: ObserverType> : Sink<O>, ObserverType where S.E == O.E {
    typealias E = O.E

    private let _observableFactory: () throws -> S

<<<<<<< HEAD
    init(observableFactory: @escaping () throws -> S, observer: O, cancel: Cancelable) {
        _observableFactory = observableFactory
        super.init(observer: observer, cancel: cancel)
=======
    init(observableFactory: @escaping () throws -> S, observer: O) {
        _observableFactory = observableFactory
        super.init(observer: observer)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
    func run() -> Disposable {
        do {
            let result = try _observableFactory()
            return result.subscribe(self)
        }
        catch let e {
            forwardOn(.error(e))
            dispose()
            return Disposables.create()
        }
    }
    
    func on(_ event: Event<E>) {
        forwardOn(event)
        
        switch event {
        case .next:
            break
        case .error:
            dispose()
        case .completed:
            dispose()
        }
    }
}

class Deferred<S: ObservableType> : Producer<S.E> {
    typealias Factory = () throws -> S
    
    private let _observableFactory : Factory
    
    init(observableFactory: @escaping Factory) {
        _observableFactory = observableFactory
    }
    
<<<<<<< HEAD
    override func run<O: ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == S.E {
        let sink = DeferredSink(observableFactory: _observableFactory, observer: observer, cancel: cancel)
        let subscription = sink.run()
        return (sink: sink, subscription: subscription)
=======
    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == S.E {
        let sink = DeferredSink(observableFactory: _observableFactory, observer: observer)
        sink.disposable = sink.run()
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
