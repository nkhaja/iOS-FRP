//
//  UIPickerView+Rx.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Segii Shulga on 5/12/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

#if os(iOS)
    
    import Foundation
#if !RX_NO_MODULE
    import RxSwift
#endif
    import UIKit

extension Reactive where Base: UIPickerView {
<<<<<<< HEAD

    /// Reactive wrapper for `delegate`.
    /// For more information take a look at `DelegateProxyType` protocol documentation.
=======
    /**
     Reactive wrapper for `delegate`.
     For more information take a look at `DelegateProxyType` protocol documentation.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var delegate: DelegateProxy {
        return RxPickerViewDelegateProxy.proxyForObject(base)
    }
    
    public var itemSelected: ControlEvent<(Int, Int)> {
        let source = delegate
<<<<<<< HEAD
            .methodInvoked(#selector(UIPickerViewDelegate.pickerView(_:didSelectRow:inComponent:)))
=======
            .observe(#selector(UIPickerViewDelegate.pickerView(_:didSelectRow:inComponent:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            .map {
                return (try castOrThrow(Int.self, $0[1]), try castOrThrow(Int.self, $0[2]))
            }
        return ControlEvent(events: source)
    }
}

#endif
