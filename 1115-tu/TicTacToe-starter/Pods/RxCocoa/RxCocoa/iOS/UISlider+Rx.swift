//
//  UISlider+Rx.swift
//  RxCocoa
//
//  Created by Alexander van der Werff on 28/05/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS)

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif
import UIKit

extension Reactive where Base: UISlider {
    
<<<<<<< HEAD
    /// Reactive wrapper for `value` property.
    public var value: ControlProperty<Float> {
        return UIControl.rx.value(
=======
    /**
    Reactive wrapper for `value` property.
    */
    public var value: ControlProperty<Float> {
        return Reactive<UIControl>.value(
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            self.base,
            getter: { slider in
                slider.value
            }, setter: { slider, value in
                slider.value = value
            }
        )
    }
    
}

#endif
