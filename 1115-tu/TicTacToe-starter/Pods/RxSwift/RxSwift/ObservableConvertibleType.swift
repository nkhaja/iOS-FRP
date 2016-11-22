//
//  ObservableConvertibleType.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 9/17/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
/// Type that can be converted to observable sequence (`Observer<E>`).
public protocol ObservableConvertibleType {
    /// Type of elements in sequence.
    associatedtype E

    /// Converts `self` to `Observable` sequence.
    ///
    /// - returns: Observable sequence that represents `self`.
=======
/**
Type that can be converted to observable sequence (`Observer<E>`).
*/
public protocol ObservableConvertibleType {
    /**
    Type of elements in sequence.
    */
    associatedtype E
    
    /**
    Converts `self` to `Observable` sequence.
    
    - returns: Observable sequence that represents `self`.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    func asObservable() -> Observable<E>
}
