//
//  Variable.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 3/28/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
/// Variable is a wrapper for `BehaviorSubject`.
///
/// Unlike `BehaviorSubject` it can't terminate with error, and when variable is deallocated
/// it will complete it's observable sequence (`asObservable`).
=======
/**
Variable is a wrapper for `BehaviorSubject`.

Unlike `BehaviorSubject` it can't terminate with error, and when variable is deallocated
 it will complete it's observable sequence (`asObservable`).
*/
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
public class Variable<Element> {

    public typealias E = Element
    
    private let _subject: BehaviorSubject<Element>
    
    private var _lock = SpinLock()
 
    // state
    private var _value: E
    
<<<<<<< HEAD
    /// Gets or sets current value of variable.
    ///
    /// Whenever a new value is set, all the observers are notified of the change.
    ///
    /// Even if the newly set value is same as the old value, observers are still notified for change.
=======
    /**
    Gets or sets current value of variable.
    
    Whenever a new value is set, all the observers are notified of the change.
    
    Even if the newly set value is same as the old value, observers are still notified for change.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var value: E {
        get {
            _lock.lock(); defer { _lock.unlock() }
            return _value
        }
        set(newValue) {
            _lock.lock()
            _value = newValue
            _lock.unlock()

            _subject.on(.next(newValue))
        }
    }
    
<<<<<<< HEAD
    /// Initializes variable with initial value.
    ///
    /// - parameter value: Initial variable value.
=======
    /**
    Initializes variable with initial value.
    
    - parameter value: Initial variable value.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public init(_ value: Element) {
        _value = value
        _subject = BehaviorSubject(value: value)
    }
    
<<<<<<< HEAD
    /// - returns: Canonical interface for push style sequence
=======
    /**
    - returns: Canonical interface for push style sequence
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func asObservable() -> Observable<E> {
        return _subject
    }

    deinit {
        _subject.on(.completed)
    }
}
