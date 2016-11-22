//
//  NSTextStorage+Rx.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Segii Shulga on 12/30/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)
import Foundation

#if !RX_NO_MODULE
    import RxSwift
#endif
    import UIKit

extension Reactive where Base: NSTextStorage {

<<<<<<< HEAD
    /// Reactive wrapper for `delegate`.
    ///
    /// For more information take a look at `DelegateProxyType` protocol documentation.
=======
    /**
     Reactive wrapper for `delegate`.

     For more information take a look at `DelegateProxyType` protocol documentation.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var delegate:DelegateProxy {
        return RxTextStorageDelegateProxy.proxyForObject(base)
    }

<<<<<<< HEAD
    /// Reactive wrapper for `delegate` message.
    public var didProcessEditingRangeChangeInLength: Observable<(editedMask:NSTextStorageEditActions, editedRange:NSRange, delta:Int)> {
        return delegate
            .methodInvoked(#selector(NSTextStorageDelegate.textStorage(_:didProcessEditing:range:changeInLength:)))
=======
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didProcessEditingRangeChangeInLength: Observable<(editedMask:NSTextStorageEditActions, editedRange:NSRange, delta:Int)> {
        return delegate
            .observe(#selector(NSTextStorageDelegate.textStorage(_:didProcessEditing:range:changeInLength:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            .map { a in
                let editedMask = NSTextStorageEditActions(rawValue: try castOrThrow(UInt.self, a[1]) )
                let editedRange = try castOrThrow(NSValue.self, a[2]).rangeValue
                let delta = try castOrThrow(Int.self, a[3])
                
                return (editedMask, editedRange, delta)
            }
    }
}
#endif
