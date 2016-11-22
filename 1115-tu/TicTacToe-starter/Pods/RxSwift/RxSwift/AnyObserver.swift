//
//  AnyObserver.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 2/28/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
/// A type-erased `ObserverType`.
///
/// Forwards operations to an arbitrary underlying observer with the same `Element` type, hiding the specifics of the underlying observer type.
public struct AnyObserver<Element> : ObserverType {
    /// The type of elements in sequence that observer can observe.
    public typealias E = Element
    
    /// Anonymous event handler type.
    public typealias EventHandler = (Event<Element>) -> Void

    private let observer: EventHandler

    /// Construct an instance whose `on(event)` calls `eventHandler(event)`
    ///
    /// - parameter eventHandler: Event handler that observes sequences events.
=======
/**
A type-erased `ObserverType`.

Forwards operations to an arbitrary underlying observer with the same `Element` type, hiding the specifics of the underlying observer type.
*/
public struct AnyObserver<Element> : ObserverType {
    /**
    The type of elements in sequence that observer can observe.
    */
    public typealias E = Element
    
    /**
    Anonymous event handler type.
    */
    public typealias EventHandler = (Event<Element>) -> Void

    public let observer: EventHandler

    /**
    Construct an instance whose `on(event)` calls `eventHandler(event)`
    
    - parameter eventHandler: Event handler that observes sequences events.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public init(eventHandler: @escaping EventHandler) {
        self.observer = eventHandler
    }
    
<<<<<<< HEAD
    /// Construct an instance whose `on(event)` calls `observer.on(event)`
    ///
    /// - parameter observer: Observer that receives sequence events.
=======
    /**
    Construct an instance whose `on(event)` calls `observer.on(event)`
    
    - parameter observer: Observer that receives sequence events.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public init<O : ObserverType>(_ observer: O) where O.E == Element {
        self.observer = observer.on
    }
    
<<<<<<< HEAD
    /// Send `event` to this observer.
    ///
    /// - parameter event: Event instance.
=======
    /**
    Send `event` to this observer.
    
    - parameter event: Event instance.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func on(_ event: Event<Element>) {
        return self.observer(event)
    }

<<<<<<< HEAD
    /// Erases type of observer and returns canonical observer.
    ///
    /// - returns: type erased observer.
=======
    /**
     Erases type of observer and returns canonical observer.

     - returns: type erased observer.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func asObserver() -> AnyObserver<E> {
        return self
    }
}

extension ObserverType {
<<<<<<< HEAD
    /// Erases type of observer and returns canonical observer.
    ///
    /// - returns: type erased observer.
    public func asObserver() -> AnyObserver<E> {
        return AnyObserver(self)
    }

    /// Transforms observer of type R to type E using custom transform method.
    /// Each event sent to result observer is transformed and sent to `self`.
    ///
    /// - returns: observer that transforms events.
    public func mapObserver<R>(_ transform: @escaping (R) throws -> E) -> AnyObserver<R> {
        return AnyObserver { e in
            self.on(e.map(transform))
        }
    }
=======
    /**
    Erases type of observer and returns canonical observer.
    
    - returns: type erased observer.
    */
    public func asObserver() -> AnyObserver<E> {
        return AnyObserver(self)
    }
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
}
