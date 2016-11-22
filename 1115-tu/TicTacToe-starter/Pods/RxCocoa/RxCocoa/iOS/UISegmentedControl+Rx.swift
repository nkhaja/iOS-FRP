//
//  UISegmentedControl+Rx.swift
//  RxCocoa
//
//  Created by Carlos García on 8/7/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
#if !RX_NO_MODULE
import RxSwift
#endif


extension Reactive where Base: UISegmentedControl {
    
<<<<<<< HEAD
    /// Reactive wrapper for `selectedSegmentIndex` property.
    public var value: ControlProperty<Int> {
        return UIControl.rx.value(
=======
    /**
    Reactive wrapper for `selectedSegmentIndex` property.
    */
    public var value: ControlProperty<Int> {
        return Reactive<UIControl>.value(
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            self.base,
            getter: { segmentedControl in
                segmentedControl.selectedSegmentIndex
            }, setter: { segmentedControl, value in
                segmentedControl.selectedSegmentIndex = value
            }
        )
    }
    
}

#endif
