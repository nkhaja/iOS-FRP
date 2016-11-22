//
//  SerialDisposable.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 3/12/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
/// Represents a disposable resource whose underlying disposable resource can be replaced by another disposable resource, causing automatic disposal of the previous underlying disposable resource.
=======
/**
Represents a disposable resource whose underlying disposable resource can be replaced by another disposable resource, causing automatic disposal of the previous underlying disposable resource.
*/
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
public final class SerialDisposable : DisposeBase, Cancelable {
    private var _lock = SpinLock()
    
    // state
    private var _current = nil as Disposable?
    private var _isDisposed = false
    
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
    /// Initializes a new instance of the `SerialDisposable`.
=======
    /**
    Initializes a new instance of the `SerialDisposable`.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    override public init() {
        super.init()
    }
    
    /**
    Gets or sets the underlying disposable.
    
    Assigning this property disposes the previous disposable object.
    
    If the `SerialDisposable` has already been disposed, assignment to this property causes immediate disposal of the given disposable object.
    */
    public var disposable: Disposable {
        get {
            return _lock.calculateLocked {
                return self.disposable
            }
        }
        set (newDisposable) {
            let disposable: Disposable? = _lock.calculateLocked {
                if _isDisposed {
                    return newDisposable
                }
                else {
                    let toDispose = _current
                    _current = newDisposable
                    return toDispose
                }
            }
            
            if let disposable = disposable {
                disposable.dispose()
            }
        }
    }
    
<<<<<<< HEAD
    /// Disposes the underlying disposable as well as all future replacements.
=======
    /**
    Disposes the underlying disposable as well as all future replacements.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func dispose() {
        _dispose()?.dispose()
    }

    private func _dispose() -> Disposable? {
        _lock.lock(); defer { _lock.unlock() }
        if _isDisposed {
            return nil
        }
        else {
            _isDisposed = true
            let current = _current
            _current = nil
            return current
        }
    }
}
