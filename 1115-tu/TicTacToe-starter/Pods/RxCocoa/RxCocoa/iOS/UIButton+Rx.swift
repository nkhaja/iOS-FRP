//
//  UIButton+Rx.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 3/28/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS)

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif
import UIKit

extension Reactive where Base: UIButton {
    
    /**
    Reactive wrapper for `TouchUpInside` control event.
    */
    public var tap: ControlEvent<Void> {
        return controlEvent(.touchUpInside)
    }
}

#endif

#if os(tvOS)

import Foundation
#if !RX_NO_MODULE
    import RxSwift
#endif
import UIKit

extension Reactive where Base: UIButton {

<<<<<<< HEAD
    /// Reactive wrapper for `PrimaryActionTriggered` control event.
=======
    /**
     Reactive wrapper for `PrimaryActionTriggered` control event.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var primaryAction: ControlEvent<Void> {
        return controlEvent(.primaryActionTriggered)
    }

}

#endif

#if os(iOS) || os(tvOS)

    import Foundation
#if !RX_NO_MODULE
    import RxSwift
#endif
    import UIKit

extension Reactive where Base: UIButton {
<<<<<<< HEAD
    
    /// Reactive wrapper for `setTitle(_:controlState:)`
    public func title(for controlState: UIControlState = []) -> UIBindingObserver<Base, String?> {
        return UIBindingObserver<Base, String?>(UIElement: self.base) { (button, title) -> () in
            button.setTitle(title, for: controlState)
        }
    }
    
=======
    /**
     Reactive wrapper for `setTitle(_:controlState:)`
     */
    public func title(controlState: UIControlState = []) -> AnyObserver<String?> {
        return UIBindingObserver<UIButton, String?>(UIElement: self.base) { (button, title) -> () in
            button.setTitle(title, for: controlState)
        }.asObserver()
    }
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
}
#endif
