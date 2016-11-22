//
//  UILabel+Rx.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 4/1/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif
import UIKit

extension Reactive where Base: UILabel {
    
<<<<<<< HEAD
    /// Bindable sink for `text` property.
    public var text: UIBindingObserver<Base, String?> {
        return UIBindingObserver(UIElement: self.base) { label, text in
            label.text = text
        }
    }

    /// Bindable sink for `attributedText` property.
    public var attributedText: UIBindingObserver<Base, NSAttributedString?> {
        return UIBindingObserver(UIElement: self.base) { label, text in
            label.attributedText = text
        }
=======
    /**
    Bindable sink for `text` property.
    */
    public var text: AnyObserver<String?> {
        return UIBindingObserver(UIElement: self.base) { label, text in
            label.text = text
        }.asObserver()
    }

    /**
    Bindable sink for `attributedText` property.
    */
    public var attributedText: AnyObserver<NSAttributedString?> {
        return UIBindingObserver(UIElement: self.base) { label, text in
            label.attributedText = text
        }.asObserver()
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
}

#endif
