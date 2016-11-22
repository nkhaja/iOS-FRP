//
//  SynchronizedSubscribeType.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 10/25/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

protocol SynchronizedSubscribeType : class, ObservableType, Lock {
    func _synchronized_subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.E == E
}

extension SynchronizedSubscribeType {
    func synchronizedSubscribe<O: ObserverType>(_ observer: O) -> Disposable where O.E == E {
        lock(); defer { unlock() }
        return _synchronized_subscribe(observer)
    }
}
