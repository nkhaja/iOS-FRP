//
//  AnonymousInvocable.swift
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

struct AnonymousInvocable : InvocableType {
    private let _action: () -> ()

    init(_ action: @escaping () -> ()) {
        _action = action
    }

    func invoke() {
        _action()
    }
}
