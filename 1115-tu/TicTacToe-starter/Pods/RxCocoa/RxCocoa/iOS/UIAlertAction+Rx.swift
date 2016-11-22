//
//  UIAlertAction+Rx.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Andrew Breckenridge on 5/7/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

import Foundation

#if os(iOS) || os(tvOS)

import Foundation
import UIKit
    
#if !RX_NO_MODULE
import RxSwift
#endif

extension Reactive where Base: UIAlertAction {

<<<<<<< HEAD
    /// Bindable sink for `enabled` property.
    public var isEnabled: UIBindingObserver<Base, Bool> {
        return UIBindingObserver(UIElement: self.base) { alertAction, value in
            alertAction.isEnabled = value
        }
=======
    /**
     Bindable sink for `enabled` property.
     */
    public var enabled: AnyObserver<Bool> {
        return UIBindingObserver(UIElement: self.base) { alertAction, value in
            alertAction.isEnabled = value
        }.asObserver()
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
}
    
#endif
