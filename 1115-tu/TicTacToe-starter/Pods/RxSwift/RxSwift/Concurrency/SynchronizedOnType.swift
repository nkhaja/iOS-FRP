//
//  SynchronizedOnType.swift
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

protocol SynchronizedOnType : class, ObserverType, Lock {
    func _synchronized_on(_ event: Event<E>)
}

extension SynchronizedOnType {
    func synchronizedOn(_ event: Event<E>) {
        lock(); defer { unlock() }
        _synchronized_on(event)
    }
}
