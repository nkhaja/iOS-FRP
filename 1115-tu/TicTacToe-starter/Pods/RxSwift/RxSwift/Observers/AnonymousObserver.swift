//
//  AnonymousObserver.swift
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

class AnonymousObserver<ElementType> : ObserverBase<ElementType> {
    typealias Element = ElementType
    
    typealias EventHandler = (Event<Element>) -> Void
    
    private let _eventHandler : EventHandler
    
    init(_ eventHandler: @escaping EventHandler) {
#if TRACE_RESOURCES
<<<<<<< HEAD
        let _ = Resources.incrementTotal()
=======
        let _ = AtomicIncrement(&resourceCount)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
#endif
        _eventHandler = eventHandler
    }

    override func onCore(_ event: Event<Element>) {
        return _eventHandler(event)
    }
    
#if TRACE_RESOURCES
    deinit {
<<<<<<< HEAD
        let _ = Resources.decrementTotal()
=======
        let _ = AtomicDecrement(&resourceCount)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
#endif
}
