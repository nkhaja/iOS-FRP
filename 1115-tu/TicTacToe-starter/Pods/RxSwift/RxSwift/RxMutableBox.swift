//
//  RxMutableBox.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 5/22/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
/// Creates mutable reference wrapper for any type.
class RxMutableBox<T> : CustomDebugStringConvertible {
    /// Wrapped value
    var value : T
    
    /// Creates reference wrapper for `value`.
    ///
    /// - parameter value: Value to wrap.
=======
/**
Creates mutable reference wrapper for any type.
*/
class RxMutableBox<T> : CustomDebugStringConvertible {
    /**
    Wrapped value
    */
    var value : T
    
    /**
    Creates reference wrapper for `value`.
    
    - parameter value: Value to wrap.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    init (_ value: T) {
        self.value = value
    }
}

extension RxMutableBox {
<<<<<<< HEAD
    /// - returns: Box description.
=======
    /**
    - returns: Box description.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    var debugDescription: String {
        return "MutatingBox(\(self.value))"
    }
}
