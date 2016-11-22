//
//  UIPageControl+Rx.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Francesco Puntillo on 14/04/2016.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)
    
import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif
import UIKit
    
extension Reactive where Base: UIPageControl {
    
<<<<<<< HEAD
    /// Bindable sink for `currentPage` property.
    public var currentPage: UIBindingObserver<Base, Int> {
        return UIBindingObserver(UIElement: self.base) { controller, page in
            controller.currentPage = page
        }
=======
    /**
    Bindable sink for `currentPage` property.
    */
    public var currentPage: AnyObserver<Int> {
        return UIBindingObserver(UIElement: self.base) { controller, page in
            controller.currentPage = page
        }.asObserver()
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
    
#endif
