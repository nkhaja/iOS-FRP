//
//  UISearchController+Rx.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Segii Shulga on 3/17/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

import Foundation

#if os(iOS)
    import Foundation
    
#if !RX_NO_MODULE
    import RxSwift
#endif
    import UIKit
    
@available(iOS 8.0, *)
extension Reactive where Base: UISearchController {
<<<<<<< HEAD
    /// Reactive wrapper for `delegate`.
    /// For more information take a look at `DelegateProxyType` protocol documentation.
    public var delegate: DelegateProxy {
        return RxSearchControllerDelegateProxy.proxyForObject(base)
    }

    /// Reactive wrapper for `delegate` message.
    public var didDismiss: Observable<Void> {
        return delegate
            .methodInvoked( #selector(UISearchControllerDelegate.didDismissSearchController(_:)))
            .map {_ in}
    }

    /// Reactive wrapper for `delegate` message.
    public var didPresent: Observable<Void> {
        return delegate
            .methodInvoked(#selector(UISearchControllerDelegate.didPresentSearchController(_:)))
            .map {_ in}
    }

    /// Reactive wrapper for `delegate` message.
    public var present: Observable<Void> {
        return delegate
            .methodInvoked( #selector(UISearchControllerDelegate.presentSearchController(_:)))
            .map {_ in}
    }

    /// Reactive wrapper for `delegate` message.
    public var willDismiss: Observable<Void> {
        return delegate
            .methodInvoked(#selector(UISearchControllerDelegate.willDismissSearchController(_:)))
            .map {_ in}
    }
    
    /// Reactive wrapper for `delegate` message.
    public var willPresent: Observable<Void> {
        return delegate
            .methodInvoked( #selector(UISearchControllerDelegate.willPresentSearchController(_:)))
=======
    /**
     Reactive wrapper for `delegate`.
     For more information take a look at `DelegateProxyType` protocol documentation.
     */
    public var delegate: DelegateProxy {
        return RxSearchControllerDelegateProxy.proxyForObject(base)
    }
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didDismiss: Observable<Void> {
        return delegate
            .observe( #selector(UISearchControllerDelegate.didDismissSearchController(_:)))
            .map {_ in}
    }
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didPresent: Observable<Void> {
        return delegate
            .observe(#selector(UISearchControllerDelegate.didPresentSearchController(_:)))
            .map {_ in}
    }
    /**
     Reactive wrapper for `delegate` message.
     */
    public var present: Observable<Void> {
        return delegate
            .observe( #selector(UISearchControllerDelegate.presentSearchController(_:)))
            .map {_ in}
    }
    /**
     Reactive wrapper for `delegate` message.
     */
    public var willDismiss: Observable<Void> {
        return delegate
            .observe(#selector(UISearchControllerDelegate.willDismissSearchController(_:)))
            .map {_ in}
    }
    /**
     Reactive wrapper for `delegate` message.
     */
    public var willPresent: Observable<Void> {
        return delegate
            .observe( #selector(UISearchControllerDelegate.willPresentSearchController(_:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            .map {_ in}
    }
    
}
    
#endif
