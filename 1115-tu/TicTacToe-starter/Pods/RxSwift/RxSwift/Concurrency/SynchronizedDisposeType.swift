//
//  SynchronizedDisposeType.swift
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

protocol SynchronizedDisposeType : class, Disposable, Lock {
    func _synchronized_dispose()
}

extension SynchronizedDisposeType {
    func synchronizedDispose() {
        lock(); defer { unlock() }
        _synchronized_dispose()
    }
<<<<<<< HEAD
}
=======
}
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
