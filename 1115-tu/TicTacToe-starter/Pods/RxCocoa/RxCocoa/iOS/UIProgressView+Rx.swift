//
//  UIProgressView+Rx.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Samuel Bae on 2/27/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif
import UIKit

extension Reactive where Base: UIProgressView {

<<<<<<< HEAD
    /// Bindable sink for `progress` property
    public var progress: UIBindingObserver<Base, Float> {
        return UIBindingObserver(UIElement: self.base) { progressView, progress in
            progressView.progress = progress
        }
=======
    /**
    Bindable sink for `progress` property
    */
    public var progress: AnyObserver<Float> {
        return UIBindingObserver(UIElement: self.base) { progressView, progress in
            progressView.progress = progress
        }.asObserver()
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }

}

#endif
