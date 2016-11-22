//
//  HistoricalSchedulerTimeConverter.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 12/27/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
/// Converts historial virtual time into real time.
///
/// Since historical virtual time is also measured in `Date`, this converter is identity function.
public struct HistoricalSchedulerTimeConverter : VirtualTimeConverterType {
    /// Virtual time unit used that represents ticks of virtual clock.
    public typealias VirtualTimeUnit = RxTime

    /// Virtual time unit used to represent differences of virtual times.
    public typealias VirtualTimeIntervalUnit = RxTimeInterval

    /// Returns identical value of argument passed because historical virtual time is equal to real time, just
    /// decoupled from local machine clock.
=======
/**
 Converts historial virtual time into real time. 
 
 Since historical virtual time is also measured in `NSDate`, this converter is identity function.
 */
public struct HistoricalSchedulerTimeConverter : VirtualTimeConverterType {
    /**
     Virtual time unit used that represents ticks of virtual clock.
     */
    public typealias VirtualTimeUnit = RxTime

    /**
     Virtual time unit used to represent differences of virtual times.
     */
    public typealias VirtualTimeIntervalUnit = RxTimeInterval

    /**
     Returns identical value of argument passed because historical virtual time is equal to real time, just 
     decoupled from local machine clock.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func convertFromVirtualTime(_ virtualTime: VirtualTimeUnit) -> RxTime {
        return virtualTime
    }

<<<<<<< HEAD
    /// Returns identical value of argument passed because historical virtual time is equal to real time, just
    /// decoupled from local machine clock.
=======
    /**
     Returns identical value of argument passed because historical virtual time is equal to real time, just 
     decoupled from local machine clock.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func convertToVirtualTime(_ time: RxTime) -> VirtualTimeUnit {
        return time
    }

<<<<<<< HEAD
    /// Returns identical value of argument passed because historical virtual time is equal to real time, just
    /// decoupled from local machine clock.
=======
    /**
     Returns identical value of argument passed because historical virtual time is equal to real time, just 
     decoupled from local machine clock.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func convertFromVirtualTimeInterval(_ virtualTimeInterval: VirtualTimeIntervalUnit) -> RxTimeInterval {
        return virtualTimeInterval
    }

<<<<<<< HEAD
    /// Returns identical value of argument passed because historical virtual time is equal to real time, just
    /// decoupled from local machine clock.
=======
    /**
     Returns identical value of argument passed because historical virtual time is equal to real time, just 
     decoupled from local machine clock.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func convertToVirtualTimeInterval(_ timeInterval: RxTimeInterval) -> VirtualTimeIntervalUnit {
        return timeInterval
    }

    /**
<<<<<<< HEAD
     Offsets `Date` by time interval.
=======
     Offsets `NSDate` by time interval.
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
     
     - parameter time: Time.
     - parameter timeInterval: Time interval offset.
     - returns: Time offsetted by time interval.
    */
    public func offsetVirtualTime(_ time: VirtualTimeUnit, offset: VirtualTimeIntervalUnit) -> VirtualTimeUnit {
        return time.addingTimeInterval(offset)
    }

<<<<<<< HEAD
    /// Compares two `Date`s.
=======
    /**
     Compares two `NSDate`s.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func compareVirtualTime(_ lhs: VirtualTimeUnit, _ rhs: VirtualTimeUnit) -> VirtualTimeComparison {
        switch lhs.compare(rhs as Date) {
        case .orderedAscending:
            return .lessThan
        case .orderedSame:
            return .equal
        case .orderedDescending:
            return .greaterThan
        }
    }
}
