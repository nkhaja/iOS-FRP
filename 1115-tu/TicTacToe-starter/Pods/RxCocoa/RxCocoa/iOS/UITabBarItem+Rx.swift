//
//  UITabBarItem+Rx.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Mateusz Derks on 04/03/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)
    
    import Foundation
    import UIKit
#if !RX_NO_MODULE
    import RxSwift
#endif
    
extension Reactive where Base: UITabBarItem {
    
<<<<<<< HEAD
    /// Bindable sink for `badgeValue` property.
    public var badgeValue: UIBindingObserver<Base, String?> {
        return UIBindingObserver(UIElement: self.base) { tabBarItem, badgeValue in
            tabBarItem.badgeValue = badgeValue
        }
=======
    /**
     Bindable sink for `badgeValue` property.
     */
    public var badgeValue: AnyObserver<String?> {
        return UIBindingObserver(UIElement: self.base) { tabBarItem, badgeValue in
            tabBarItem.badgeValue = badgeValue
        }.asObserver()
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
}
    
#endif
