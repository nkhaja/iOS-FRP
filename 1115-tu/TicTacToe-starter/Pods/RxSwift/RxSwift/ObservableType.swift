//
//  ObservableType.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 8/8/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
/// Represents a push style sequence.
public protocol ObservableType : ObservableConvertibleType {
    /// Type of elements in sequence.
=======
/**
Represents a push style sequence.
*/
public protocol ObservableType : ObservableConvertibleType {
    /**
    Type of elements in sequence.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    associatedtype E
    
    /**
    Subscribes `observer` to receive events for this sequence.
    
    ### Grammar
    
    **Next\* (Error | Completed)?**
    
    * sequences can produce zero or more elements so zero or more `Next` events can be sent to `observer`
    * once an `Error` or `Completed` event is sent, the sequence terminates and can't produce any other elements
    
    It is possible that events are sent from different threads, but no two events can be sent concurrently to
    `observer`.
    
    ### Resource Management
    
    When sequence sends `Complete` or `Error` event all internal resources that compute sequence elements
    will be freed.
    
    To cancel production of sequence elements and free resources immediatelly, call `dispose` on returned
    subscription.
    
    - returns: Subscription for `observer` that can be used to cancel production of sequence elements and free resources.
    */
<<<<<<< HEAD
=======
    // @warn_unused_result(message: "http://git.io/rxs.ud")
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    func subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.E == E
}

extension ObservableType {
    
<<<<<<< HEAD
    /// Default implementation of converting `ObservableType` to `Observable`.
=======
    /**
    Default implementation of converting `ObservableType` to `Observable`.
    */
    // @warn_unused_result(message:"http://git.io/rxs.uo")
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func asObservable() -> Observable<E> {
        // temporary workaround
        //return Observable.create(subscribe: self.subscribe)
        return Observable.create { o in
            return self.subscribe(o)
        }
    }
}
