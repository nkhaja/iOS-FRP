//
//  RxTextStorageDelegateProxy.swift
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
    
public class RxTextStorageDelegateProxy
    : DelegateProxy
    , DelegateProxyType
    , NSTextStorageDelegate {
    
    
<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public class func setCurrentDelegate(_ delegate: AnyObject?, toObject object: AnyObject) {
        let textStorage: NSTextStorage = castOrFatalError(object)
        textStorage.delegate = castOptionalOrFatalError(delegate)
    }
    
<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public class func currentDelegateFor(_ object: AnyObject) -> AnyObject? {
        let textStorage: NSTextStorage = castOrFatalError(object)
        return textStorage.delegate
    }


}
#endif
