//
//  HistoricalScheduler.swift
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
/// Provides a virtual time scheduler that uses `Date` for absolute time and `NSTimeInterval` for relative time.
=======
/**
  Provides a virtual time scheduler that uses `NSDate` for absolute time and `NSTimeInterval` for relative time.
*/
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
public class HistoricalScheduler : VirtualTimeScheduler<HistoricalSchedulerTimeConverter> {

    /**
      Creates a new historical scheduler with initial clock value.
     
     - parameter initialClock: Initial value for virtual clock.
    */
    public init(initialClock: RxTime = Date(timeIntervalSince1970: 0)) {
        super.init(initialClock: initialClock, converter: HistoricalSchedulerTimeConverter())
    }
<<<<<<< HEAD
=======
    
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
}
