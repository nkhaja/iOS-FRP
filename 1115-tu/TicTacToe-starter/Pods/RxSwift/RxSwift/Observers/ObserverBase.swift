//
//  ObserverBase.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 2/15/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class ObserverBase<ElementType> : Disposable, ObserverType {
    typealias E = ElementType

    private var _isStopped: AtomicInt = 0

    func on(_ event: Event<E>) {
        switch event {
        case .next:
            if _isStopped == 0 {
                onCore(event)
            }
        case .error, .completed:

            if !AtomicCompareAndSwap(0, 1, &_isStopped) {
                return
            }

            onCore(event)
        }
    }

    func onCore(_ event: Event<E>) {
        abstractMethod()
    }

    func dispose() {
<<<<<<< HEAD
        _ = AtomicCompareAndSwap(0, 1, &_isStopped)
=======
        _isStopped = 1
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
