//
//  UITextField+Rx.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 2/21/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif
import UIKit

extension Reactive where Base: UITextField {
    
<<<<<<< HEAD
    /// Reactive wrapper for `text` property.
    public var text: ControlProperty<String?> {
        return UIControl.rx.value(
            base,
            getter: { textField in
                textField.text
=======
    /**
    Reactive wrapper for `text` property.
    */
    public var text: ControlProperty<String> {
        return Reactive<UIControl>.value(
            base,
            getter: { textField in
                textField.text ?? ""
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            }, setter: { textField, value in
                // This check is important because setting text value always clears control state
                // including marked text selection which is imporant for proper input 
                // when IME input method is used.
                if textField.text != value {
                    textField.text = value
                }
            }
        )
    }
    
}

#endif
