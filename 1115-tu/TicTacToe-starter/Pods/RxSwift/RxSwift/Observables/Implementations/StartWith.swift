//
//  StartWith.swift
<<<<<<< HEAD
//  RxSwift
=======
//  RxCocoa
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 4/6/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

class StartWith<Element>: Producer<Element> {
    let elements: [Element]
    let source: Observable<Element>

    init(source: Observable<Element>, elements: [Element]) {
        self.source = source
        self.elements = elements
        super.init()
    }

<<<<<<< HEAD
    override func run<O : ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == Element {
=======
    override func run<O : ObserverType>(_ observer: O) -> Disposable where O.E == Element {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        for e in elements {
            observer.on(.next(e))
        }

<<<<<<< HEAD
        return (sink: Disposables.create(), subscription: source.subscribe(observer))
=======
        return source.subscribe(observer)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
