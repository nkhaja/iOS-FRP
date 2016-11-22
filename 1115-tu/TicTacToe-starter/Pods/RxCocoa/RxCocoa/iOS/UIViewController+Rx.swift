//
//  UIViewController+Rx.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Kyle Fuller on 27/05/2016.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

import Foundation

#if os(iOS)
  import UIKit

#if !RX_NO_MODULE
  import RxSwift
#endif

<<<<<<< HEAD
    extension Reactive where Base: UIViewController {

        /// Bindable sink for `title`.
        public var title: UIBindingObserver<Base, String> {
            return UIBindingObserver(UIElement: self.base) { viewController, title in
                viewController.title = title
            }
        }
    
    }
=======
  extension Reactive where Base: UIViewController {

    /**
     Bindable sink for `title`.
     */
    public var title: AnyObserver<String> {
      return UIBindingObserver(UIElement: self.base) { viewController, title in
        viewController.title = title
      }.asObserver()
    }
  }
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
#endif
