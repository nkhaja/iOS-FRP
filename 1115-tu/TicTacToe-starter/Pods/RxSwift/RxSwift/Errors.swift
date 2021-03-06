//
//  Errors.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 3/28/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

let RxErrorDomain       = "RxErrorDomain"
let RxCompositeFailures = "RxCompositeFailures"

<<<<<<< HEAD
/// Generic Rx error codes.
public enum RxError
    : Swift.Error
    , CustomDebugStringConvertible {
    /// Unknown error occured.
    case unknown
    /// Performing an action on disposed object.
    case disposed(object: AnyObject)
    /// Aritmetic overflow error.
    case overflow
    /// Argument out of range error.
    case argumentOutOfRange
    /// Sequence doesn't contain any elements.
    case noElements
    /// Sequence contains more than one element.
    case moreThanOneElement
    /// Timeout error.
    case timeout
}

extension RxError {
    /// A textual representation of `self`, suitable for debugging.
=======
/**
Generic Rx error codes.
*/
public enum RxError
    : Swift.Error
    , CustomDebugStringConvertible {
    /**
    Unknown error occured.
    */
    case unknown
    /**
    Performing an action on disposed object.
    */
    case disposed(object: AnyObject)
    /**
    Aritmetic overflow error.
    */
    case overflow
    /**
    Argument out of range error.
    */
    case argumentOutOfRange
    /**
    Sequence doesn't contain any elements.
    */
    case noElements
    /**
    Sequence contains more than one element.
    */
    case moreThanOneElement
    /**
     Timeout error.
     */
    case timeout
}

public extension RxError {
    /**
     A textual representation of `self`, suitable for debugging.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var debugDescription: String {
        switch self {
        case .unknown:
            return "Unknown error occured."
        case .disposed(let object):
            return "Object `\(object)` was already disposed."
        case .overflow:
            return "Arithmetic overflow occured."
        case .argumentOutOfRange:
            return "Argument out of range."
        case .noElements:
            return "Sequence doesn't contain any elements."
        case .moreThanOneElement:
            return "Sequence contains more than one element."
        case .timeout:
            return "Sequence timeout."
        }
    }
}
