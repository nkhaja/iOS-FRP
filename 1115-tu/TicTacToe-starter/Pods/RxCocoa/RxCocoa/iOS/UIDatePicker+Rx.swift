//
//  UIDatePicker+Rx.swift
//  RxCocoa
//
//  Created by Daniel Tartaglia on 5/31/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS)

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif
import UIKit

extension Reactive where Base: UIDatePicker {
    
<<<<<<< HEAD
    /// Reactive wrapper for `date` property.
    public var date: ControlProperty<Date> {
        return UIControl.rx.value(
=======
    /**
    Reactive wrapper for `date` property.
    */
    public var date: ControlProperty<Date> {
        return Reactive<UIControl>.value(
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            self.base,
            getter: { datePicker in
                datePicker.date
            }, setter: { datePicker, value in
                datePicker.date = value
            }
        )
    }
    
}

#endif
