//
//  UITabBar+Rx.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Jesse Farless on 5/13/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)
import Foundation
import UIKit

#if !RX_NO_MODULE
import RxSwift
#endif

/**
 iOS only
 */
#if os(iOS)
extension Reactive where Base: UITabBar {

<<<<<<< HEAD
    /// Reactive wrapper for `delegate` message `tabBar:willBeginCustomizingItems:`.
    public var willBeginCustomizing: ControlEvent<[UITabBarItem]> {
        
        let source = delegate.methodInvoked(#selector(UITabBarDelegate.tabBar(_:willBeginCustomizing:)))
=======
    /**
     Reactive wrapper for `delegate` message `tabBar:willBeginCustomizingItems:`.
    */
    public var willBeginCustomizing: ControlEvent<[UITabBarItem]> {
        
        let source = delegate.observe(#selector(UITabBarDelegate.tabBar(_:willBeginCustomizing:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            .map { a in
                return try castOrThrow([UITabBarItem].self, a[1])
            }

        return ControlEvent(events: source)
    }

<<<<<<< HEAD
    /// Reactive wrapper for `delegate` message `tabBar:didBeginCustomizingItems:`.
    public var didBeginCustomizing: ControlEvent<[UITabBarItem]> {
        let source = delegate.methodInvoked(#selector(UITabBarDelegate.tabBar(_:didBeginCustomizing:)))
=======
    /**
     Reactive wrapper for `delegate` message `tabBar:didBeginCustomizingItems:`.
    */
    public var didBeginCustomizing: ControlEvent<[UITabBarItem]> {
        let source = delegate.observe(#selector(UITabBarDelegate.tabBar(_:didBeginCustomizing:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            .map { a in
                return try castOrThrow([UITabBarItem].self, a[1])
            }

        return ControlEvent(events: source)
    }

<<<<<<< HEAD
    /// Reactive wrapper for `delegate` message `tabBar:willEndCustomizingItems:changed:`.
    public var willEndCustomizing: ControlEvent<([UITabBarItem], Bool)> {
        let source = delegate.methodInvoked(#selector(UITabBarDelegate.tabBar(_:willEndCustomizing:changed:)))
            .map { (a: [Any]) -> (([UITabBarItem], Bool)) in
=======
    /**
     Reactive wrapper for `delegate` message `tabBar:willEndCustomizingItems:changed:`.
    */
    public var willEndCustomizing: ControlEvent<([UITabBarItem], Bool)> {
        let source = delegate.observe(#selector(UITabBarDelegate.tabBar(_:willEndCustomizing:changed:)))
            .map { (a: [AnyObject]) -> (([UITabBarItem], Bool)) in
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
                let items = try castOrThrow([UITabBarItem].self, a[1])
                let changed = try castOrThrow(Bool.self, a[2])
                return (items, changed)
            }

        return ControlEvent(events: source)
    }

<<<<<<< HEAD
    /// Reactive wrapper for `delegate` message `tabBar:didEndCustomizingItems:changed:`.
    public var didEndCustomizing: ControlEvent<([UITabBarItem], Bool)> {
        let source = delegate.methodInvoked(#selector(UITabBarDelegate.tabBar(_:didEndCustomizing:changed:)))
            .map { (a: [Any]) -> (([UITabBarItem], Bool)) in
=======
    /**
     Reactive wrapper for `delegate` message `tabBar:didEndCustomizingItems:changed:`.
    */
    public var didEndCustomizing: ControlEvent<([UITabBarItem], Bool)> {
        let source = delegate.observe(#selector(UITabBarDelegate.tabBar(_:didEndCustomizing:changed:)))
            .map { (a: [AnyObject]) -> (([UITabBarItem], Bool)) in
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
                let items = try castOrThrow([UITabBarItem].self, a[1])
                let changed = try castOrThrow(Bool.self, a[2])
                return (items, changed)
            }

        return ControlEvent(events: source)
    }

}
#endif

/**
 iOS and tvOS
 */
extension UITabBar {
    
<<<<<<< HEAD
    /// Factory method that enables subclasses to implement their own `delegate`.
    ///
    /// - returns: Instance of delegate proxy that wraps `delegate`.
=======
    /**
     Factory method that enables subclasses to implement their own `delegate`.

     - returns: Instance of delegate proxy that wraps `delegate`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func createRxDelegateProxy() -> RxTabBarDelegateProxy {
        return RxTabBarDelegateProxy(parentObject: self)
    }

}

extension Reactive where Base: UITabBar {
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
    public var delegate: DelegateProxy {
        return RxTabBarDelegateProxy.proxyForObject(base)
    }

<<<<<<< HEAD
    /// Reactive wrapper for `delegate` message `tabBar:didSelectItem:`.
    public var didSelectItem: ControlEvent<UITabBarItem> {
        let source = delegate.methodInvoked(#selector(UITabBarDelegate.tabBar(_:didSelect:)))
=======
    /**
     Reactive wrapper for `delegate` message `tabBar:didSelectItem:`.
    */
    public var didSelectItem: ControlEvent<UITabBarItem> {
        let source = delegate.observe(#selector(UITabBarDelegate.tabBar(_:didSelect:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            .map { a in
                return try castOrThrow(UITabBarItem.self, a[1])
            }

        return ControlEvent(events: source)
    }

}

#endif
