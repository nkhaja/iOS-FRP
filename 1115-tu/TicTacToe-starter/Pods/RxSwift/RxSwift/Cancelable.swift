//
//  Cancelable.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 3/12/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
/// Represents disposable resource with state tracking.
public protocol Cancelable : Disposable {
    /// Was resource disposed.
    var isDisposed: Bool { get }
}
=======
/**
Represents disposable resource with state tracking.
*/
public protocol Cancelable : Disposable {
    /**
    - returns: Was resource disposed.
    */
    var isDisposed: Bool { get }
}

public extension Cancelable {
    
    @available(*, deprecated, renamed: "isDisposed")
    var disposed: Bool {
        return isDisposed
    }
    
}
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
