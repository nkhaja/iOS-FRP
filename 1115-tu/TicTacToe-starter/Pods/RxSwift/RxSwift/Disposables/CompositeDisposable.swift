//
//  CompositeDisposable.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 2/20/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
/// Represents a group of disposable resources that are disposed together.
public final class CompositeDisposable : DisposeBase, Disposable, Cancelable {
    /// Key used to remove disposable from composite disposable
    public struct DisposeKey {
        fileprivate let key: BagKey
        fileprivate init(key: BagKey) {
            self.key = key
        }
    }

=======
/**
Represents a group of disposable resources that are disposed together.
*/
public final class CompositeDisposable : DisposeBase, Disposable, Cancelable {
    public typealias DisposeKey = Bag<Disposable>.KeyType
    
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    private var _lock = SpinLock()
    
    // state
    private var _disposables: Bag<Disposable>? = Bag()

    public var isDisposed: Bool {
        _lock.lock(); defer { _lock.unlock() }
        return _disposables == nil
    }
    
    public override init() {
    }
    
<<<<<<< HEAD
    /// Initializes a new instance of composite disposable with the specified number of disposables.
=======
    /**
     Initializes a new instance of composite disposable with the specified number of disposables.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public init(_ disposable1: Disposable, _ disposable2: Disposable) {
        // This overload is here to make sure we are using optimized version up to 4 arguments.
        let _ = _disposables!.insert(disposable1)
        let _ = _disposables!.insert(disposable2)
    }
    
<<<<<<< HEAD
    /// Initializes a new instance of composite disposable with the specified number of disposables.
=======
    /**
     Initializes a new instance of composite disposable with the specified number of disposables.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public init(_ disposable1: Disposable, _ disposable2: Disposable, _ disposable3: Disposable) {
        // This overload is here to make sure we are using optimized version up to 4 arguments.
        let _ = _disposables!.insert(disposable1)
        let _ = _disposables!.insert(disposable2)
        let _ = _disposables!.insert(disposable3)
    }
    
<<<<<<< HEAD
    /// Initializes a new instance of composite disposable with the specified number of disposables.
=======
    /**
     Initializes a new instance of composite disposable with the specified number of disposables.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public init(_ disposable1: Disposable, _ disposable2: Disposable, _ disposable3: Disposable, _ disposable4: Disposable, _ disposables: Disposable...) {
        // This overload is here to make sure we are using optimized version up to 4 arguments.
        let _ = _disposables!.insert(disposable1)
        let _ = _disposables!.insert(disposable2)
        let _ = _disposables!.insert(disposable3)
        let _ = _disposables!.insert(disposable4)
        
        for disposable in disposables {
            let _ = _disposables!.insert(disposable)
        }
    }
    
<<<<<<< HEAD
    /// Initializes a new instance of composite disposable with the specified number of disposables.
=======
    /**
     Initializes a new instance of composite disposable with the specified number of disposables.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public init(disposables: [Disposable]) {
        for disposable in disposables {
            let _ = _disposables!.insert(disposable)
        }
    }

    /**
<<<<<<< HEAD
=======
    Adds a disposable to the CompositeDisposable or disposes the disposable if the CompositeDisposable is disposed.
    
    - parameter disposable: Disposable to add.
    - returns: Key that can be used to remove disposable from composite disposable. In case dispose bag was already
        disposed `nil` will be returned.
    */
    @available(*, deprecated, renamed: "insert(_:)")
    public func addDisposable(_ disposable: Disposable) -> DisposeKey? {
        return insert(disposable)
    }
    
    /**
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
     Adds a disposable to the CompositeDisposable or disposes the disposable if the CompositeDisposable is disposed.
     
     - parameter disposable: Disposable to add.
     - returns: Key that can be used to remove disposable from composite disposable. In case dispose bag was already
     disposed `nil` will be returned.
     */
    public func insert(_ disposable: Disposable) -> DisposeKey? {
        let key = _insert(disposable)
        
        if key == nil {
            disposable.dispose()
        }
        
        return key
    }
    
    private func _insert(_ disposable: Disposable) -> DisposeKey? {
        _lock.lock(); defer { _lock.unlock() }

<<<<<<< HEAD
        let bagKey = _disposables?.insert(disposable)
        return bagKey.map(DisposeKey.init)
    }
    
    /// - returns: Gets the number of disposables contained in the `CompositeDisposable`.
=======
        return _disposables?.insert(disposable)
    }
    
    /**
    - returns: Gets the number of disposables contained in the `CompositeDisposable`.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var count: Int {
        _lock.lock(); defer { _lock.unlock() }
        return _disposables?.count ?? 0
    }
    
<<<<<<< HEAD
    /// Removes and disposes the disposable identified by `disposeKey` from the CompositeDisposable.
    ///
    /// - parameter disposeKey: Key used to identify disposable to be removed.
=======
    /**
     Removes and disposes the disposable identified by `disposeKey` from the CompositeDisposable.
     
     - parameter disposeKey: Key used to identify disposable to be removed.
     */
    @available(*, deprecated, renamed: "remove(for:)")
    public func removeDisposable(_ disposeKey: DisposeKey) {
        remove(for: disposeKey)
    }
    
    /**
     Removes and disposes the disposable identified by `disposeKey` from the CompositeDisposable.
     
     - parameter disposeKey: Key used to identify disposable to be removed.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func remove(for disposeKey: DisposeKey) {
        _remove(for: disposeKey)?.dispose()
    }
    
    private func _remove(for disposeKey: DisposeKey) -> Disposable? {
        _lock.lock(); defer { _lock.unlock() }
<<<<<<< HEAD
        return _disposables?.removeKey(disposeKey.key)
    }
    
    /// Disposes all disposables in the group and removes them from the group.
=======
        return _disposables?.removeKey(disposeKey)
    }
    
    /**
    Disposes all disposables in the group and removes them from the group.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func dispose() {
        if let disposables = _dispose() {
            disposeAll(in: disposables)
        }
    }

    private func _dispose() -> Bag<Disposable>? {
        _lock.lock(); defer { _lock.unlock() }

        let disposeBag = _disposables
        _disposables = nil

        return disposeBag
    }
}
<<<<<<< HEAD

extension Disposables {

    /// Creates a disposable with the given disposables.
    public static func create(_ disposable1: Disposable, _ disposable2: Disposable, _ disposable3: Disposable) -> Cancelable {
        return CompositeDisposable(disposable1, disposable2, disposable3)
    }
    
    /// Creates a disposable with the given disposables.
    public static func create(_ disposable1: Disposable, _ disposable2: Disposable, _ disposable3: Disposable, _ disposables: Disposable ...) -> Cancelable {
        var disposables = disposables
        disposables.append(disposable1)
        disposables.append(disposable2)
        disposables.append(disposable3)
        return CompositeDisposable(disposables: disposables)
    }
    
    /// Creates a disposable with the given disposables.
    public static func create(_ disposables: [Disposable]) -> Cancelable {
        switch disposables.count {
        case 2:
            return Disposables.create(disposables[0], disposables[1])
        default:
            return CompositeDisposable(disposables: disposables)
        }
    }
}
=======
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
