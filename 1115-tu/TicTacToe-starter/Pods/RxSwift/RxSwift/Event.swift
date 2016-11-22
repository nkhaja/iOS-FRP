//
//  Event.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 2/8/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
/// Represents a sequence event.
///
/// Sequence grammar: 
/// **next\* (error | completed)**
=======
/**
Represents a sequence event.

Sequence grammar:
next\* (error | completed)
*/
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
public enum Event<Element> {
    /// Next element is produced.
    case next(Element)

    /// Sequence terminated with an error.
    case error(Swift.Error)

    /// Sequence completed successfully.
    case completed
}

extension Event : CustomDebugStringConvertible {
    /// - returns: Description of event.
    public var debugDescription: String {
        switch self {
        case .next(let value):
            return "next(\(value))"
        case .error(let error):
            return "error(\(error))"
        case .completed:
            return "completed"
        }
    }
}

extension Event {
<<<<<<< HEAD
    /// Is `Completed` or `Error` event.
=======
    /// - returns: Is `Completed` or `Error` event.
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var isStopEvent: Bool {
        switch self {
        case .next: return false
        case .error, .completed: return true
        }
    }

<<<<<<< HEAD
    /// If `Next` event, returns element value.
=======
    /// - returns: If `Next` event, returns element value.
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var element: Element? {
        if case .next(let value) = self {
            return value
        }
        return nil
    }

<<<<<<< HEAD
    /// If `Error` event, returns error.
=======
    /// - returns: If `Error` event, returns error.
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var error: Swift.Error? {
        if case .error(let error) = self {
            return error
        }
        return nil
    }
}
<<<<<<< HEAD

extension Event {
    /// Maps sequence elements using transform. If error happens during the transform .error
    /// will be returned as value
    public func map<Result>(_ transform: (Element) throws -> Result) -> Event<Result> {
        do {
            switch self {
            case let .next(element):
                return .next(try transform(element))
            case let .error(error):
                return .error(error)
            case .completed:
                return .completed
            }
        }
        catch let e {
            return .error(e)
        }
    }
}
=======
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
