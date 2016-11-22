//
//  Observable.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 2/8/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
/// A type-erased `ObservableType`. 
///
/// It represents a push style sequence.
public class Observable<Element> : ObservableType {
    /// Type of elements in sequence.
=======
/**
A type-erased `ObservableType`. 

It represents a push style sequence.
*/
public class Observable<Element> : ObservableType {
    /**
    Type of elements in sequence.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public typealias E = Element
    
    init() {
#if TRACE_RESOURCES
<<<<<<< HEAD
        let _ = Resources.incrementTotal()
=======
        OSAtomicIncrement32(&resourceCount)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
#endif
    }
    
    public func subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.E == E {
        abstractMethod()
    }
    
    public func asObservable() -> Observable<E> {
        return self
    }
    
    deinit {
#if TRACE_RESOURCES
<<<<<<< HEAD
        let _ = Resources.decrementTotal()
=======
        let _ = AtomicDecrement(&resourceCount)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
#endif
    }

    // this is kind of ugly I know :(
    // Swift compiler reports "Not supported yet" when trying to override protocol extensions, so ¯\_(ツ)_/¯

<<<<<<< HEAD
    /// Optimizations for map operator
    internal func composeMap<R>(_ selector: @escaping (Element) throws -> R) -> Observable<R> {
        return Map(source: self, transform: selector)
=======
    /**
    Optimizations for map operator
    */
    internal func composeMap<R>(_ selector: @escaping (Element) throws -> R) -> Observable<R> {
        return Map(source: self, selector: selector)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}

