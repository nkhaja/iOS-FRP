//
//  RefCountDisposable.swift
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
/// Represents a disposable resource that only disposes its underlying disposable resource when all dependent disposable objects have been disposed.
=======
/**
    Represents a disposable resource that only disposes its underlying disposable resource when all dependent disposable objects have been disposed.
 */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
public final class RefCountDisposable : DisposeBase, Cancelable {
    private var _lock = SpinLock()
    private var _disposable = nil as Disposable?
    private var _primaryDisposed = false
    private var _count = 0

<<<<<<< HEAD
    /// - returns: Was resource disposed.
=======
    /**
     - returns: Was resource disposed.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var isDisposed: Bool {
        _lock.lock(); defer { _lock.unlock() }
        return _disposable == nil
    }

<<<<<<< HEAD
    /// Initializes a new instance of the `RefCountDisposable`.
=======
    /**
     Initializes a new instance of the `RefCountDisposable`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public init(disposable: Disposable) {
        _disposable = disposable
        super.init()
    }

    /**
     Holds a dependent disposable that when disposed decreases the refcount on the underlying disposable.

     When getter is called, a dependent disposable contributing to the reference count that manages the underlying disposable's lifetime is returned.
     */
    public func retain() -> Disposable {
        return _lock.calculateLocked {
            if let _ = _disposable {

                do {
                    let _ = try incrementChecked(&_count)
                } catch (_) {
                    rxFatalError("RefCountDisposable increment failed")
                }

                return RefCountInnerDisposable(self)
            } else {
                return Disposables.create()
            }
        }
    }

<<<<<<< HEAD
    /// Disposes the underlying disposable only when all dependent disposables have been disposed.
=======
    /**
     Disposes the underlying disposable only when all dependent disposables have been disposed.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func dispose() {
        let oldDisposable: Disposable? = _lock.calculateLocked {
            if let oldDisposable = _disposable, !_primaryDisposed
            {
                _primaryDisposed = true

                if (_count == 0)
                {
                    _disposable = nil
                    return oldDisposable
                }
            }

            return nil
        }

        if let disposable = oldDisposable {
            disposable.dispose()
        }
    }

    fileprivate func release() {
        let oldDisposable: Disposable? = _lock.calculateLocked {
            if let oldDisposable = _disposable {
                do {
                    let _ = try decrementChecked(&_count)
                } catch (_) {
                    rxFatalError("RefCountDisposable decrement on release failed")
                }

                guard _count >= 0 else {
                    rxFatalError("RefCountDisposable counter is lower than 0")
                }

                if _primaryDisposed && _count == 0 {
                    _disposable = nil
                    return oldDisposable
                }
            }

            return nil
        }

        if let disposable = oldDisposable {
            disposable.dispose()
        }
    }
}

internal final class RefCountInnerDisposable: DisposeBase, Disposable
{
    private let _parent: RefCountDisposable
    private var _isDisposed: AtomicInt = 0

    init(_ parent: RefCountDisposable)
    {
        _parent = parent
        super.init()
    }

    internal func dispose()
    {
        if AtomicCompareAndSwap(0, 1, &_isDisposed) {
            _parent.release()
        }
    }
}
