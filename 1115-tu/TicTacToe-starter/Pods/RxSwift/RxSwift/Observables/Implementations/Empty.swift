//
//  Empty.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 8/30/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class Empty<Element> : Producer<Element> {
    override func subscribe<O : ObserverType>(_ observer: O) -> Disposable where O.E == Element {
        observer.on(.completed)
        return Disposables.create()
    }
}
