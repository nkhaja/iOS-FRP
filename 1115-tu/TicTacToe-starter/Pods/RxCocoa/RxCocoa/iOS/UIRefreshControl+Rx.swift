//
//  UIRefreshControl+Rx.swift
//  RxCocoa
//
//  Created by Yosuke Ishikawa on 1/31/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

#if os(iOS)
import UIKit

#if !RX_NO_MODULE
import RxSwift
#endif

extension Reactive where Base: UIRefreshControl {

<<<<<<< HEAD
    /// Bindable sink for `beginRefreshing()`, `endRefreshing()` methods.
    public var refreshing: UIBindingObserver<Base, Bool> {
=======
    /**
    Bindable sink for `beginRefreshing()`, `endRefreshing()` methods.
    */
    public var refreshing: AnyObserver<Bool> {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        return UIBindingObserver(UIElement: self.base) { refreshControl, refresh in
            if refresh {
                refreshControl.beginRefreshing()
            } else {
                refreshControl.endRefreshing()
            }
<<<<<<< HEAD
        }
=======
        }.asObserver()
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }

}

#endif
