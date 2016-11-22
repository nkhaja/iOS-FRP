//
//  DisposeBase.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 4/4/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
/// Base class for all disposables.
public class DisposeBase {
    init() {
#if TRACE_RESOURCES
    let _ = Resources.incrementTotal()
=======
/**
Base class for all disposables.
*/
public class DisposeBase {
    init() {
#if TRACE_RESOURCES
    let _ = AtomicIncrement(&resourceCount)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
#endif
    }
    
    deinit {
#if TRACE_RESOURCES
<<<<<<< HEAD
    let _ = Resources.decrementTotal()
=======
    let _ = AtomicDecrement(&resourceCount)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
#endif
    }
}
