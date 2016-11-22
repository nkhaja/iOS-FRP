//
//  RxSearchBarDelegateProxy.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 7/4/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
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
public class RxSearchBarDelegateProxy
    : DelegateProxy
    , UISearchBarDelegate
    , DelegateProxyType {

<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public class func currentDelegateFor(_ object: AnyObject) -> AnyObject? {
        let searchBar: UISearchBar = castOrFatalError(object)
        return searchBar.delegate
    }

<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public class func setCurrentDelegate(_ delegate: AnyObject?, toObject object: AnyObject) {
        let searchBar: UISearchBar = castOrFatalError(object)
        searchBar.delegate = castOptionalOrFatalError(delegate)
    }

    // MARK: Delegate proxy methods
    
#if os(iOS)
<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public override class func createProxyForObject(_ object: AnyObject) -> AnyObject {
        let searchBar = (object as! UISearchBar)
        
        return castOrFatalError(searchBar.createRxDelegateProxy())
    }
#endif
    
}

#endif
