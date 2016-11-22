//
//  RxTarget.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 7/12/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif

class RxTarget : NSObject
               , Disposable {
    
    private var retainSelf: RxTarget?
    
    override init() {
        super.init()
        self.retainSelf = self

#if TRACE_RESOURCES
<<<<<<< HEAD
        _ = Resources.incrementTotal()
=======
        OSAtomicIncrement32(&resourceCount)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
#endif

#if DEBUG
        MainScheduler.ensureExecutingOnScheduler()
#endif
    }
    
    func dispose() {
#if DEBUG
        MainScheduler.ensureExecutingOnScheduler()
#endif
        self.retainSelf = nil
    }

#if TRACE_RESOURCES
    deinit {
<<<<<<< HEAD
        _ = Resources.decrementTotal()
=======
        OSAtomicDecrement32(&resourceCount)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
#endif
}
