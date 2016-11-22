//
//  RxCollectionViewDataSourceProxy.swift
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

let collectionViewDataSourceNotSet = CollectionViewDataSourceNotSet()

class CollectionViewDataSourceNotSet
    : NSObject
    , UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        rxAbstractMethodWithMessage(dataSourceNotSet)
    }
    
}

<<<<<<< HEAD
/// For more information take a look at `DelegateProxyType`.
=======
/**
     For more information take a look at `DelegateProxyType`.
 */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
public class RxCollectionViewDataSourceProxy
    : DelegateProxy
    , UICollectionViewDataSource
    , DelegateProxyType {

<<<<<<< HEAD
    /// Typed parent object.
    public weak private(set) var collectionView: UICollectionView?

    private weak var _requiredMethodsDataSource: UICollectionViewDataSource? = collectionViewDataSourceNotSet

    /// Initializes `RxCollectionViewDataSourceProxy`
    ///
    /// - parameter parentObject: Parent object for delegate proxy.
=======
    /**
     Typed parent object.
     */
    public weak private(set) var collectionView: UICollectionView?
    
    private weak var _requiredMethodsDataSource: UICollectionViewDataSource? = collectionViewDataSourceNotSet

    /**
     Initializes `RxCollectionViewDataSourceProxy`

     - parameter parentObject: Parent object for delegate proxy.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public required init(parentObject: AnyObject) {
        self.collectionView = (parentObject as! UICollectionView)
        super.init(parentObject: parentObject)
    }
    
    // MARK: delegate

<<<<<<< HEAD
    /// Required delegate method implementation.
=======
    /**
    Required delegate method implementation.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (_requiredMethodsDataSource ?? collectionViewDataSourceNotSet).collectionView(collectionView, numberOfItemsInSection: section)
    }
    
<<<<<<< HEAD
    /// Required delegate method implementation.
=======
    /**
     Required delegate method implementation.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return (_requiredMethodsDataSource ?? collectionViewDataSourceNotSet).collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    // MARK: proxy

<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
    For more information take a look at `DelegateProxyType`.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public override class func createProxyForObject(_ object: AnyObject) -> AnyObject {
        let collectionView = (object as! UICollectionView)

        return castOrFatalError(collectionView.createRxDataSourceProxy())
    }

<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
    For more information take a look at `DelegateProxyType`.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public override class func delegateAssociatedObjectTag() -> UnsafeRawPointer {
        return _pointer(&dataSourceAssociatedTag)
    }

<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public class func setCurrentDelegate(_ delegate: AnyObject?, toObject object: AnyObject) {
        let collectionView: UICollectionView = castOrFatalError(object)
        collectionView.dataSource = castOptionalOrFatalError(delegate)
    }

<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public class func currentDelegateFor(_ object: AnyObject) -> AnyObject? {
        let collectionView: UICollectionView = castOrFatalError(object)
        return collectionView.dataSource
    }

<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public override func setForwardToDelegate(_ forwardToDelegate: AnyObject?, retainDelegate: Bool) {
        let requiredMethodsDataSource: UICollectionViewDataSource? = castOptionalOrFatalError(forwardToDelegate)
        _requiredMethodsDataSource = requiredMethodsDataSource ?? collectionViewDataSourceNotSet
        super.setForwardToDelegate(forwardToDelegate, retainDelegate: retainDelegate)
    }
}

#endif
