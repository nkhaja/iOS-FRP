//
//  RxScrollViewDelegateProxy.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 6/19/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)

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
public class RxScrollViewDelegateProxy
    : DelegateProxy
    , UIScrollViewDelegate
    , DelegateProxyType {

    fileprivate var _contentOffsetSubject: ReplaySubject<CGPoint>?

<<<<<<< HEAD
    /// Typed parent object.
    public weak fileprivate(set) var scrollView: UIScrollView?

    /// Optimized version used for observing content offset changes.
=======
    /**
     Typed parent object.
     */
    public weak fileprivate(set) var scrollView: UIScrollView?

    /**
     Optimized version used for observing content offset changes.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    internal var contentOffsetSubject: Observable<CGPoint> {
        if _contentOffsetSubject == nil {
            let replaySubject = ReplaySubject<CGPoint>.create(bufferSize:1)
            _contentOffsetSubject = replaySubject
            replaySubject.on(.next(self.scrollView?.contentOffset ?? CGPoint.zero))
        }
        
        return _contentOffsetSubject!
    }

<<<<<<< HEAD
    /// Initializes `RxScrollViewDelegateProxy`
    ///
    /// - parameter parentObject: Parent object for delegate proxy.
=======
    /**
     Initializes `RxScrollViewDelegateProxy`

     - parameter parentObject: Parent object for delegate proxy.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public required init(parentObject: AnyObject) {
        self.scrollView = (parentObject as! UIScrollView)
        super.init(parentObject: parentObject)
    }
    
    // MARK: delegate methods

<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
    For more information take a look at `DelegateProxyType`.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let contentOffset = _contentOffsetSubject {
            contentOffset.on(.next(scrollView.contentOffset))
        }
        self._forwardToDelegate?.scrollViewDidScroll?(scrollView)
    }
    
    // MARK: delegate proxy

<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
    For more information take a look at `DelegateProxyType`.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public override class func createProxyForObject(_ object: AnyObject) -> AnyObject {
        let scrollView = (object as! UIScrollView)
        
        return castOrFatalError(scrollView.createRxDelegateProxy())
    }

<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public class func setCurrentDelegate(_ delegate: AnyObject?, toObject object: AnyObject) {
        let scrollView: UIScrollView = castOrFatalError(object)
        scrollView.delegate = castOptionalOrFatalError(delegate)
    }

<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public class func currentDelegateFor(_ object: AnyObject) -> AnyObject? {
        let scrollView: UIScrollView = castOrFatalError(object)
        return scrollView.delegate
    }
    
    deinit {
        if let contentOffset = _contentOffsetSubject {
            contentOffset.on(.completed)
        }
    }
}

#endif
