//
//  NSLayoutConstraint+Rx.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 12/6/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

<<<<<<< HEAD
#if !os(Linux)

import Foundation

#if os(macOS)
=======
import Foundation

#if os(OSX)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
import Cocoa
#else
import UIKit
#endif

#if !RX_NO_MODULE
import RxSwift
#endif

<<<<<<< HEAD
#if os(iOS) || os(macOS) || os(tvOS)
extension Reactive where Base: NSLayoutConstraint {
    /// Bindable sink for `constant` property.
    public var constant: UIBindingObserver<Base, CGFloat> {
        return UIBindingObserver(UIElement: self.base) { constraint, constant in
            constraint.constant = constant
        }
    }
    
    /// Bindable sink for `active` property.
    @available(iOS 8, OSX 10.10, *)
    public var active:  UIBindingObserver<Base, Bool> {
        return UIBindingObserver(UIElement: self.base) { constraint, value in
            constraint.isActive = value
        }
=======
#if os(iOS) || os(OSX) || os(tvOS)
extension Reactive where Base: NSLayoutConstraint {
    /**
     Bindable sink for `constant` property.
     */
    public var constant: AnyObserver<CGFloat> {
        return UIBindingObserver(UIElement: self.base) { constraint, constant in
            constraint.constant = constant
        }.asObserver()
    }
    
    /**
     Bindable sink for `active` property.
     */
    @available(iOS 8, OSX 10.10, *)
    public var active: AnyObserver<Bool> {
        return UIBindingObserver(UIElement: self.base) { constraint, value in
            constraint.isActive = value
        }.asObserver()
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}

#endif
<<<<<<< HEAD

#endif
=======
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
