//
//  BinaryDisposable.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 6/12/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
/// Represents two disposable resources that are disposed together.
=======
/**
Represents two disposable resources that are disposed together.
*/
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
private final class BinaryDisposable : DisposeBase, Cancelable {

    private var _isDisposed: AtomicInt = 0

    // state
    private var _disposable1: Disposable?
    private var _disposable2: Disposable?

<<<<<<< HEAD
    /// - returns: Was resource disposed.
=======
    /**
    - returns: Was resource disposed.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    var isDisposed: Bool {
        return _isDisposed > 0
    }

<<<<<<< HEAD
    /// Constructs new binary disposable from two disposables.
    ///
    /// - parameter disposable1: First disposable
    /// - parameter disposable2: Second disposable
=======
    /**
    Constructs new binary disposable from two disposables.

    - parameter disposable1: First disposable
    - parameter disposable2: Second disposable
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    init(_ disposable1: Disposable, _ disposable2: Disposable) {
        _disposable1 = disposable1
        _disposable2 = disposable2
        super.init()
    }

<<<<<<< HEAD
    /// Calls the disposal action if and only if the current instance hasn't been disposed yet.
    ///
    /// After invoking disposal action, disposal action will be dereferenced.
=======
    /**
    Calls the disposal action if and only if the current instance hasn't been disposed yet.

    After invoking disposal action, disposal action will be dereferenced.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    func dispose() {
        if AtomicCompareAndSwap(0, 1, &_isDisposed) {
            _disposable1?.dispose()
            _disposable2?.dispose()
            _disposable1 = nil
            _disposable2 = nil
        }
    }
}

<<<<<<< HEAD
extension Disposables {
    
    /// Creates a disposable with the given disposables.
    public static func create(_ disposable1: Disposable, _ disposable2: Disposable) -> Cancelable {
=======
public extension Disposables {
    
    /**
     Creates a disposable with the given disposables.
     */
    static func create(_ disposable1: Disposable, _ disposable2: Disposable) -> Cancelable {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        return BinaryDisposable(disposable1, disposable2)
    }
    
}
