//
//  ScheduledItem.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 9/2/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

struct ScheduledItem<T>
    : ScheduledItemType
    , InvocableType {
    typealias Action = (T) -> Disposable
    
    private let _action: Action
    private let _state: T

    private let _disposable = SingleAssignmentDisposable()

    var isDisposed: Bool {
        return _disposable.isDisposed
    }
    
    init(action: @escaping Action, state: T) {
        _action = action
        _state = state
    }
    
    func invoke() {
<<<<<<< HEAD
         _disposable.setDisposable(_action(_state))
=======
         _disposable.disposable = _action(_state)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
    func dispose() {
        _disposable.dispose()
    }
}
