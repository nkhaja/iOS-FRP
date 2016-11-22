//
//  Using.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Yury Korolev on 10/15/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class UsingSink<SourceType, ResourceType: Disposable, O: ObserverType> : Sink<O>, ObserverType where O.E == SourceType {

    typealias Parent = Using<SourceType, ResourceType>
    typealias E = O.E

    private let _parent: Parent
    
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
        var disposable = Disposables.create()
        
        do {
            let resource = try _parent._resourceFactory()
            disposable = resource
            let source = try _parent._observableFactory(resource)
            
            return Disposables.create(
                source.subscribe(self),
                disposable
            )
        } catch let error {
            return Disposables.create(
                Observable.error(error).subscribe(self),
                disposable
            )
        }
    }
    
    func on(_ event: Event<E>) {
        switch event {
        case let .next(value):
            forwardOn(.next(value))
        case let .error(error):
            forwardOn(.error(error))
            dispose()
        case .completed:
            forwardOn(.completed)
            dispose()
        }
    }
}

class Using<SourceType, ResourceType: Disposable>: Producer<SourceType> {
    
    typealias E = SourceType
    
    typealias ResourceFactory = () throws -> ResourceType
    typealias ObservableFactory = (ResourceType) throws -> Observable<SourceType>
    
    fileprivate let _resourceFactory: ResourceFactory
    fileprivate let _observableFactory: ObservableFactory
    
    
    init(resourceFactory: @escaping ResourceFactory, observableFactory: @escaping ObservableFactory) {
        _resourceFactory = resourceFactory
        _observableFactory = observableFactory
    }
    
<<<<<<< HEAD
    override func run<O : ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == E {
        let sink = UsingSink(parent: self, observer: observer, cancel: cancel)
        let subscription = sink.run()
        return (sink: sink, subscription: subscription)
=======
    override func run<O : ObserverType>(_ observer: O) -> Disposable where O.E == E {
        let sink = UsingSink(parent: self, observer: observer)
        sink.disposable = sink.run()
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
