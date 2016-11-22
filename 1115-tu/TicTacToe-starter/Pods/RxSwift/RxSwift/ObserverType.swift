//
//  ObserverType.swift
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
/// Supports push-style iteration over an observable sequence.
public protocol ObserverType {
    /// The type of elements in sequence that observer can observe.
    associatedtype E

    /// Notify observer about sequence event.
    ///
    /// - parameter event: Event that occured.
    func on(_ event: Event<E>)
}

/// Convenience API extensions to provide alternate next, error, completed events
extension ObserverType {
    
    /// Convenience method equivalent to `on(.next(element: E))`
    ///
    /// - parameter element: Next element to send to observer(s)
    public final func onNext(_ element: E) {
        on(.next(element))
    }
    
    /// Convenience method equivalent to `on(.completed)`
    public final func onCompleted() {
        on(.completed)
    }
    
    /// Convenience method equivalent to `on(.error(Swift.Error))`
    /// - parameter error: Swift.Error to send to observer(s)
    public final func onError(_ error: Swift.Error) {
=======
/**
Supports push-style iteration over an observable sequence.
*/
public protocol ObserverType {
    /**
    The type of elements in sequence that observer can observe.
    */
    associatedtype E

    /**
    Notify observer about sequence event.
    
    - parameter event: Event that occured.
    */
    func on(_ event: Event<E>)
}

/**
Convenience API extensions to provide alternate next, error, completed events
*/
public extension ObserverType {
    
    /**
    Convenience method equivalent to `on(.next(element: E))`
    
    - parameter element: Next element to send to observer(s)
    */
    final func onNext(_ element: E) {
        on(.next(element))
    }
    
    /**
    Convenience method equivalent to `on(.completed)`
    */
    final func onCompleted() {
        on(.completed)
    }
    
    /**
    Convenience method equivalent to `on(.error(Swift.Error))`
    - parameter error: Swift.Error to send to observer(s)
    */
    final func onError(_ error: Swift.Error) {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        on(.error(error))
    }
}
