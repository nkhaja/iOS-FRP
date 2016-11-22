//
//  Rx.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 2/14/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

#if TRACE_RESOURCES
<<<<<<< HEAD
    fileprivate var resourceCount: AtomicInt = 0

    /// Resource utilization information
    public struct Resources {
        /// Counts internal Rx resource allocations (Observables, Observers, Disposables, etc.). This provides a simple way to detect leaks during development.
        public static var total: Int32 {
            return resourceCount.valueSnapshot()
        }

        /// Increments `Resources.total` resource count.
        ///
        /// - returns: New resource count
        public static func incrementTotal() -> Int32 {
            return AtomicIncrement(&resourceCount)
        }

        /// Decrements `Resources.total` resource count
        ///
        /// - returns: New resource count
        public static func decrementTotal() -> Int32 {
            return AtomicDecrement(&resourceCount)
        }
    }
=======
/// Counts internal Rx resource allocations (Observables, Observers, Disposables, etc.). This provides a simple way to detect leaks during development.
public var resourceCount: AtomicInt = 0
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
#endif

/// Swift does not implement abstract methods. This method is used as a runtime check to ensure that methods which intended to be abstract (i.e., they should be implemented in subclasses) are not called directly on the superclass.
func abstractMethod() -> Swift.Never {
    rxFatalError("Abstract method")
}

func rxFatalError(_ lastMessage: String) -> Swift.Never  {
    // The temptation to comment this line is great, but please don't, it's for your own good. The choice is yours.
    fatalError(lastMessage)
}

func incrementChecked(_ i: inout Int) throws -> Int {
    if i == Int.max {
        throw RxError.overflow
    }
<<<<<<< HEAD
    defer { i += 1 }
    return i
=======
    let result = i
    i += 1
    return result
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
}

func decrementChecked(_ i: inout Int) throws -> Int {
    if i == Int.min {
        throw RxError.overflow
    }
<<<<<<< HEAD
    defer { i -= 1 }
    return i
=======
    let result = i
    i -= 1
    return result
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
}
