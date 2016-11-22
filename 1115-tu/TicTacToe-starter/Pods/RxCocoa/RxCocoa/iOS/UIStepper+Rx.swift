//
//  UIStepper+Rx.swift
//  RxCocoa
//
//  Created by Yuta ToKoRo on 9/1/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS)

import Foundation
import UIKit
#if !RX_NO_MODULE
import RxSwift
#endif

extension Reactive where Base: UIStepper {
    
<<<<<<< HEAD
    /// Reactive wrapper for `value` property.
    public var value: ControlProperty<Double> {
        return UIControl.rx.value(
=======
    /**
    Reactive wrapper for `value` property.
    */
    public var value: ControlProperty<Double> {
        return Reactive<UIControl>.value(
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            self.base,
            getter: { stepper in
                stepper.value
            }, setter: { stepper, value in
                stepper.value = value
            }
        )
    }
    
}

#endif

