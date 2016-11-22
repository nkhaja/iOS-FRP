//
//  NopDisposable.swift
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

<<<<<<< HEAD
/// Represents a disposable that does nothing on disposal.
///
/// Nop = No Operation
fileprivate struct NopDisposable : Disposable {
 
    fileprivate static let noOp: Disposable = NopDisposable()
    
    fileprivate init() {
        
    }
    
    /// Does nothing.
    public func dispose() {
    }
}

extension Disposables {
    /**
     Creates a disposable that does nothing on disposal.
     */
    static public func create() -> Disposable {
        return NopDisposable.noOp
=======
/**
Represents a disposable that does nothing on disposal.

Nop = No Operation
*/
public struct NopDisposable : Disposable {
 
    /**
    Singleton instance of `NopDisposable`.
    */
    @available(*, deprecated, renamed: "Disposables.create()")
    public static let instance: Disposable = NopDisposable()
    
    init() {
        
    }
    
    /**
    Does nothing.
    */
    public func dispose() {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
