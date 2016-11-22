//
//  String+Rx.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 12/25/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

extension String {
<<<<<<< HEAD
    /// This is needed because on Linux Swift doesn't have `rangeOfString(..., options: .BackwardsSearch)`
=======
    /**
     This is needed because on Linux Swift doesn't have `rangeOfString(..., options: .BackwardsSearch)`
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    func lastIndexOf(_ character: Character) -> Index? {
        var index = endIndex
        while index > startIndex {
            index = self.index(before: index)
            if self[index] == character {
                return index
            }
        }

        return nil
    }
}
