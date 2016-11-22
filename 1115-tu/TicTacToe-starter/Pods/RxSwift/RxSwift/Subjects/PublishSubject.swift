//
//  PublishSubject.swift
<<<<<<< HEAD
//  RxSwift
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 2/11/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
/// Represents an object that is both an observable sequence as well as an observer.
///
/// Each notification is broadcasted to all subscribed observers.
=======
/**
Represents an object that is both an observable sequence as well as an observer.

Each notification is broadcasted to all subscribed observers.
*/
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
final public class PublishSubject<Element>
    : Observable<Element>
    , SubjectType
    , Cancelable
    , ObserverType
    , SynchronizedUnsubscribeType {
    public typealias SubjectObserverType = PublishSubject<Element>
    
    typealias DisposeKey = Bag<AnyObserver<Element>>.KeyType
    
<<<<<<< HEAD
    /// Indicates whether the subject has any observers
=======
    /**
     Indicates whether the subject has any observers
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var hasObservers: Bool {
        _lock.lock(); defer { _lock.unlock() }
        return _observers.count > 0
    }
    
    private var _lock = NSRecursiveLock()
    
    // state
    private var _isDisposed = false
    private var _observers = Bag<AnyObserver<Element>>()
    private var _stopped = false
    private var _stoppedEvent = nil as Event<Element>?
    
<<<<<<< HEAD
    /// Indicates whether the subject has been isDisposed.
=======
    /**
    Indicates whether the subject has been isDisposed.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var isDisposed: Bool {
        return _isDisposed
    }
    
<<<<<<< HEAD
    /// Creates a subject.
=======
    /**
    Creates a subject.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public override init() {
        super.init()
    }
    
<<<<<<< HEAD
    /// Notifies all subscribed observers about next event.
    ///
    /// - parameter event: Event to send to the observers.
    public func on(_ event: Event<Element>) {
        _synchronized_on(event).on(event)
    }

    func _synchronized_on(_ event: Event<E>) -> Bag<AnyObserver<Element>> {
        _lock.lock(); defer { _lock.unlock() }

        switch event {
        case .next(_):
            if _isDisposed || _stopped {
                return Bag()
            }
            
            return _observers
=======
    /**
    Notifies all subscribed observers about next event.
    
    - parameter event: Event to send to the observers.
    */
    public func on(_ event: Event<Element>) {
        _lock.lock(); defer { _lock.unlock() }
        _synchronized_on(event)
    }

    func _synchronized_on(_ event: Event<E>) {
        switch event {
        case .next(_):
            if _isDisposed || _stopped {
                return
            }
            
            _observers.on(event)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        case .completed, .error:
            if _stoppedEvent == nil {
                _stoppedEvent = event
                _stopped = true
<<<<<<< HEAD
                let observers = _observers
                _observers.removeAll()
                return observers
            }

            return Bag()
=======
                _observers.on(event)
                _observers.removeAll()
            }
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        }
    }
    
    /**
    Subscribes an observer to the subject.
    
    - parameter observer: Observer to subscribe to the subject.
    - returns: Disposable object that can be used to unsubscribe the observer from the subject.
    */
    public override func subscribe<O : ObserverType>(_ observer: O) -> Disposable where O.E == Element {
        _lock.lock(); defer { _lock.unlock() }
        return _synchronized_subscribe(observer)
    }

    func _synchronized_subscribe<O : ObserverType>(_ observer: O) -> Disposable where O.E == E {
        if let stoppedEvent = _stoppedEvent {
            observer.on(stoppedEvent)
            return Disposables.create()
        }
        
        if _isDisposed {
            observer.on(.error(RxError.disposed(object: self)))
            return Disposables.create()
        }
        
        let key = _observers.insert(observer.asObserver())
        return SubscriptionDisposable(owner: self, key: key)
    }

    func synchronizedUnsubscribe(_ disposeKey: DisposeKey) {
        _lock.lock(); defer { _lock.unlock() }
        _synchronized_unsubscribe(disposeKey)
    }

    func _synchronized_unsubscribe(_ disposeKey: DisposeKey) {
        _ = _observers.removeKey(disposeKey)
    }
    
<<<<<<< HEAD
    /// Returns observer interface for subject.
=======
    /**
    Returns observer interface for subject.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func asObserver() -> PublishSubject<Element> {
        return self
    }
    
<<<<<<< HEAD
    /// Unsubscribe all observers and release resources.
=======
    /**
    Unsubscribe all observers and release resources.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func dispose() {
        _lock.lock(); defer { _lock.unlock() }
        _synchronized_dispose()
    }

    final func _synchronized_dispose() {
        _isDisposed = true
        _observers.removeAll()
        _stoppedEvent = nil
    }
}
