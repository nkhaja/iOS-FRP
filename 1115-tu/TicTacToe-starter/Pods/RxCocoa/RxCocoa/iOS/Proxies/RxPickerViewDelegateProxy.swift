//
//  RxPickerViewDelegateProxy.swift
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

public class RxPickerViewDelegateProxy
    : DelegateProxy
    , DelegateProxyType
    , UIPickerViewDelegate {
    
<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public class func setCurrentDelegate(_ delegate: AnyObject?, toObject object: AnyObject) {
        let pickerView: UIPickerView = castOrFatalError(object)
        pickerView.delegate = castOptionalOrFatalError(delegate)
    }
    
<<<<<<< HEAD
    /// For more information take a look at `DelegateProxyType`.
=======
    /**
     For more information take a look at `DelegateProxyType`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public class func currentDelegateFor(_ object: AnyObject) -> AnyObject? {
        let pickerView: UIPickerView = castOrFatalError(object)
        return pickerView.delegate
    }
}
#endif
