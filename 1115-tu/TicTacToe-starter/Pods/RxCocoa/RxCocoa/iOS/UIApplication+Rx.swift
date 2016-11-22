//
//  UIApplication+Rx.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  RxExample
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Mads Bøgeskov on 18/01/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

import Foundation

#if os(iOS)
    import UIKit

#if !RX_NO_MODULE
    import RxSwift
#endif

    extension Reactive where Base: UIApplication {
        
<<<<<<< HEAD
        /// Bindable sink for `networkActivityIndicatorVisible`.
        public var isNetworkActivityIndicatorVisible: UIBindingObserver<Base, Bool> {
            return UIBindingObserver(UIElement: self.base) { application, active in
                application.isNetworkActivityIndicatorVisible = active
            }
=======
        /**
         Bindable sink for `networkActivityIndicatorVisible`.
         */
        public var networkActivityIndicatorVisible: AnyObserver<Bool> {
            return UIBindingObserver(UIElement: self.base) { application, active in
                application.isNetworkActivityIndicatorVisible = active
            }.asObserver()
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        }
    }
#endif

