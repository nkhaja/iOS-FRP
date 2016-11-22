//
//  UINavigationItem+Rx.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by kumapo on 2016/05/09.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)
    
import Foundation
import UIKit
#if !RX_NO_MODULE
import RxSwift
#endif
    
extension Reactive where Base: UINavigationItem {
<<<<<<< HEAD
    
    /// Bindable sink for `title` property.
    public var title: UIBindingObserver<Base, String?> {
        return UIBindingObserver(UIElement: self.base) { navigationItem, text in
            navigationItem.title = text
        }
=======
    /**
    Bindable sink for `title` property.
    */
    public var title: AnyObserver<String?> {
        return UIBindingObserver(UIElement: self.base) { navigationItem, text in
            navigationItem.title = text
            }.asObserver()
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
        
}
    
#endif
