//
//  RxCollectionViewDelegateProxy.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 6/29/15.
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
public class RxCollectionViewDelegateProxy
    : RxScrollViewDelegateProxy
    , UICollectionViewDelegate
    , UICollectionViewDelegateFlowLayout {

<<<<<<< HEAD
    /// Typed parent object.
    public weak private(set) var collectionView: UICollectionView?

    /// Initializes `RxCollectionViewDelegateProxy`
    ///
    /// - parameter parentObject: Parent object for delegate proxy.
=======
    /**
     Typed parent object.
     */
    public weak private(set) var collectionView: UICollectionView?

    /**
     Initializes `RxCollectionViewDelegateProxy`

     - parameter parentObject: Parent object for delegate proxy.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public required init(parentObject: AnyObject) {
        self.collectionView = (parentObject as! UICollectionView)
        super.init(parentObject: parentObject)
    }
}

#endif
