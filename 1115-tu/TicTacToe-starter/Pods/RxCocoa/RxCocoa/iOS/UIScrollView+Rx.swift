//
//  UIScrollView+Rx.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 4/3/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif
import UIKit

extension UIScrollView {
    
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
    public func createRxDelegateProxy() -> RxScrollViewDelegateProxy {
        return RxScrollViewDelegateProxy(parentObject: self)
    }
    
}

extension Reactive where Base: UIScrollView {

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
        return RxScrollViewDelegateProxy.proxyForObject(base)
    }
    
<<<<<<< HEAD
    /// Reactive wrapper for `contentOffset`.
=======
    /**
    Reactive wrapper for `contentOffset`.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var contentOffset: ControlProperty<CGPoint> {
        let proxy = RxScrollViewDelegateProxy.proxyForObject(base)

        let bindingObserver = UIBindingObserver(UIElement: self.base) { scrollView, contentOffset in
            scrollView.contentOffset = contentOffset
        }

        return ControlProperty(values: proxy.contentOffsetSubject, valueSink: bindingObserver)
    }

<<<<<<< HEAD
    /// Bindable sink for `scrollEnabled` property.
    public var isScrollEnabled: UIBindingObserver<Base, Bool> {
        return UIBindingObserver(UIElement: self.base) { scrollView, scrollEnabled in
            scrollView.isScrollEnabled = scrollEnabled
        }
    }

    /// Installs delegate as forwarding delegate on `delegate`.
    /// Delegate won't be retained.
    ///
    /// It enables using normal delegate mechanism with reactive delegate mechanism.
    ///
    /// - parameter delegate: Delegate object.
    /// - returns: Disposable object that can be used to unbind the delegate.
=======
    /**
    Bindable sink for `scrollEnabled` property.
    */
    public var scrollEnabled: AnyObserver<Bool> {
        return UIBindingObserver(UIElement: self.base) { scrollView, scrollEnabled in
            scrollView.isScrollEnabled = scrollEnabled
        }.asObserver()
    }

    /**
    Installs delegate as forwarding delegate on `delegate`.
    Delegate won't be retained.
    
    It enables using normal delegate mechanism with reactive delegate mechanism.
    
    - parameter delegate: Delegate object.
    - returns: Disposable object that can be used to unbind the delegate.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func setDelegate(_ delegate: UIScrollViewDelegate)
        -> Disposable {
        return RxScrollViewDelegateProxy.installForwardDelegate(delegate, retainDelegate: false, onProxyForObject: self.base)
    }
}

#endif
