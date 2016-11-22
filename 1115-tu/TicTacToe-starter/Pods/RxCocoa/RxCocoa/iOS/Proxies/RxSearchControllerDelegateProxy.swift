//
//  RxSearchControllerDelegateProxy.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Segii Shulga on 3/17/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

#if os(iOS)
   
   import Foundation
#if !RX_NO_MODULE
   import RxSwift
#endif
   import UIKit

<<<<<<< HEAD
/// For more information take a look at `DelegateProxyType`.
=======
/**
 For more information take a look at `DelegateProxyType`.
 */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
@available(iOS 8.0, *)
public class RxSearchControllerDelegateProxy
    : DelegateProxy
    , DelegateProxyType
    , UISearchControllerDelegate {
    
<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public class func setCurrentDelegate(_ delegate: AnyObject?, toObject object: AnyObject) {
        let searchController: UISearchController = castOrFatalError(object)
        searchController.delegate = castOptionalOrFatalError(delegate)
    }
    
<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public class func currentDelegateFor(_ object: AnyObject) -> AnyObject? {
        let searchController: UISearchController = castOrFatalError(object)
        return searchController.delegate
    }
    
}
   
#endif
