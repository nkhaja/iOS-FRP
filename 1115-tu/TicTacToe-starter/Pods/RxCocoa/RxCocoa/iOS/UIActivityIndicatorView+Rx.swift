//
//  UIActivityIndicatorView+Rx.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Ivan Persidskiy on 02/12/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit

#if !RX_NO_MODULE
import RxSwift
#endif

extension Reactive where Base: UIActivityIndicatorView {

<<<<<<< HEAD
    /// Bindable sink for `startAnimating()`, `stopAnimating()` methods.
    public var isAnimating: UIBindingObserver<Base, Bool> {
=======
    /**
    Bindable sink for `startAnimating()`, `stopAnimating()` methods.
    */
    public var animating: AnyObserver<Bool> {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        return UIBindingObserver(UIElement: self.base) { activityIndicator, active in
            if active {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
<<<<<<< HEAD
        }
=======
        }.asObserver()
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }

}

#endif
