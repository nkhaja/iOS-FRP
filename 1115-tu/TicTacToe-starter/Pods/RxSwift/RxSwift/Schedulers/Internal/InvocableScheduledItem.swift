//
//  InvocableScheduledItem.swift
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

struct InvocableScheduledItem<I: InvocableWithValueType> : InvocableType {

    let _invocable: I
    let _state: I.Value

    init(invocable: I, state: I.Value) {
        _invocable = invocable
        _state = state
    }

    func invoke() {
        _invocable.invoke(_state)
    }
}
