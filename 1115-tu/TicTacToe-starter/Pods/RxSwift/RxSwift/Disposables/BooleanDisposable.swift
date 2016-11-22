//
//  BooleanDisposable.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Junior B. on 10/29/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
/// Represents a disposable resource that can be checked for disposal status.
public final class BooleanDisposable : Disposable, Cancelable {

    internal static let BooleanDisposableTrue = BooleanDisposable(isDisposed: true)
    private var _isDisposed = false
    
    /// Initializes a new instance of the `BooleanDisposable` class
    public init() {
    }
    
    /// Initializes a new instance of the `BooleanDisposable` class with given value
=======
/**
Represents a disposable resource that can be checked for disposal status.
*/
public final class BooleanDisposable : Disposable, Cancelable {
 
    internal static let BooleanDisposableTrue = BooleanDisposable(isDisposed: true)
    private var _isDisposed = false
    
    /**
        Initializes a new instance of the `BooleanDisposable` class
     */
    public init() {
    }
    
    /**
        Initializes a new instance of the `BooleanDisposable` class with given value
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public init(isDisposed: Bool) {
        self._isDisposed = isDisposed
    }
    
<<<<<<< HEAD
    /// - returns: Was resource disposed.
=======
    /**
        - returns: Was resource disposed.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var isDisposed: Bool {
        return _isDisposed
    }
    
<<<<<<< HEAD
    /// Sets the status to disposed, which can be observer through the `isDisposed` property.
=======
    /**
        Sets the status to disposed, which can be observer through the `isDisposed` property.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func dispose() {
        _isDisposed = true
    }
}
