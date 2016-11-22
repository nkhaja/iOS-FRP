//
//  RxTabBarDelegateProxy.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Jesse Farless on 5/14/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)
import Foundation
import UIKit

#if !RX_NO_MODULE
import RxSwift
#endif

<<<<<<< HEAD
/// For more information take a look at `DelegateProxyType`.
=======
/**
 For more information take a look at `DelegateProxyType`.
 */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
public class RxTabBarDelegateProxy
    : DelegateProxy
    , UITabBarDelegate
    , DelegateProxyType {

<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public class func currentDelegateFor(_ object: AnyObject) -> AnyObject? {
        let tabBar: UITabBar = castOrFatalError(object)
        return tabBar.delegate
    }

<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public class func setCurrentDelegate(_ delegate: AnyObject?, toObject object: AnyObject) {
        let tabBar: UITabBar = castOrFatalError(object)
        tabBar.delegate = castOptionalOrFatalError(delegate)
    }

<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public override class func createProxyForObject(_ object: AnyObject) -> AnyObject {
        let tabBar = (object as! UITabBar)

        return castOrFatalError(tabBar.createRxDelegateProxy())
    }

}

#endif
