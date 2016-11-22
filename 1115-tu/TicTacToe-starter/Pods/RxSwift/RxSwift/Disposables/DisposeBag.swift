//
//  DisposeBag.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 3/25/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

extension Disposable {
<<<<<<< HEAD
    /// Adds `self` to `bag`.
    ///
    /// - parameter bag: `DisposeBag` to add `self` to.
=======
    /**
    Adds `self` to `bag`.
    
    - parameter bag: `DisposeBag` to add `self` to.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func addDisposableTo(_ bag: DisposeBag) {
        bag.insert(self)
    }
}

/**
Thread safe bag that disposes added disposables on `deinit`.

This returns ARC (RAII) like resource management to `RxSwift`.

In case contained disposables need to be disposed, just put a different dispose bag
or create a new one in its place.

    self.existingDisposeBag = DisposeBag()

In case explicit disposal is necessary, there is also `CompositeDisposable`.
*/
public final class DisposeBag: DisposeBase {
    
    private var _lock = SpinLock()
    
    // state
    private var _disposables = [Disposable]()
    private var _isDisposed = false
    
<<<<<<< HEAD
    /// Constructs new empty dispose bag.
=======
    /**
    Constructs new empty dispose bag.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public override init() {
        super.init()
    }
    
<<<<<<< HEAD
    /// Adds `disposable` to be disposed when dispose bag is being deinited.
    ///
    /// - parameter disposable: Disposable to add.
=======
    /**
    Adds `disposable` to be disposed when dispose bag is being deinited.
    
    - parameter disposable: Disposable to add.
    */
    @available(*, deprecated, renamed: "insert(_:)")
    public func addDisposable(_ disposable: Disposable) {
        insert(disposable)
    }
    
    /**
     Adds `disposable` to be disposed when dispose bag is being deinited.
     
     - parameter disposable: Disposable to add.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func insert(_ disposable: Disposable) {
        _insert(disposable)?.dispose()
    }
    
    private func _insert(_ disposable: Disposable) -> Disposable? {
        _lock.lock(); defer { _lock.unlock() }
        if _isDisposed {
            return disposable
        }

        _disposables.append(disposable)

        return nil
    }

<<<<<<< HEAD
    /// This is internal on purpose, take a look at `CompositeDisposable` instead.
=======
    /**
    This is internal on purpose, take a look at `CompositeDisposable` instead.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    private func dispose() {
        let oldDisposables = _dispose()

        for disposable in oldDisposables {
            disposable.dispose()
        }
    }

    private func _dispose() -> [Disposable] {
        _lock.lock(); defer { _lock.unlock() }

        let disposables = _disposables
        
        _disposables.removeAll(keepingCapacity: false)
        _isDisposed = true
        
        return disposables
    }
    
    deinit {
        dispose()
    }
}
