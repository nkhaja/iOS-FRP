//
//  UIView+Rx.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 12/6/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)

import Foundation
import UIKit
#if !RX_NO_MODULE
import RxSwift
#endif

extension Reactive where Base: UIView {
<<<<<<< HEAD
    /// Bindable sink for `hidden` property.
    public var isHidden: UIBindingObserver<Base, Bool> {
        return UIBindingObserver(UIElement: self.base) { view, hidden in
            view.isHidden = hidden
        }
    }

    /// Bindable sink for `alpha` property.
    public var alpha: UIBindingObserver<Base, CGFloat> {
        return UIBindingObserver(UIElement: self.base) { view, alpha in
            view.alpha = alpha
        }
=======
    /**
     Bindable sink for `hidden` property.
     */
    public var hidden: AnyObserver<Bool> {
        return UIBindingObserver(UIElement: self.base) { view, hidden in
            view.isHidden = hidden
        }.asObserver()
    }

    /**
     Bindable sink for `alpha` property.
     */
    public var alpha: AnyObserver<CGFloat> {
        return UIBindingObserver(UIElement: self.base) { view, alpha in
            view.alpha = alpha
        }.asObserver()
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}

#endif
