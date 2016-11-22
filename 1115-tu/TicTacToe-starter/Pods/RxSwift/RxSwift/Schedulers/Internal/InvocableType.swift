//
//  InvocableType.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 11/7/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

protocol InvocableType {
    func invoke()
}

protocol InvocableWithValueType {
    associatedtype Value

    func invoke(_ value: Value)
}
