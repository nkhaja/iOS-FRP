//
//  MainScheduler.swift
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
<<<<<<< HEAD
import Dispatch

/**
Abstracts work that needs to be performed on `DispatchQueue.main`. In case `schedule` methods are called from `DispatchQueue.main`, it will perform action immediately without scheduling.
=======

/**
Abstracts work that needs to be performed on `MainThread`. In case `schedule` methods are called from main thread, it will perform action immediately without scheduling.
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5

This scheduler is usually used to perform UI work.

Main scheduler is a specialization of `SerialDispatchQueueScheduler`.

This scheduler is optimized for `observeOn` operator. To ensure observable sequence is subscribed on main thread using `subscribeOn`
operator please use `ConcurrentMainScheduler` because it is more optimized for that purpose.
*/
public final class MainScheduler : SerialDispatchQueueScheduler {

    private let _mainQueue: DispatchQueue

    var numberEnqueued: AtomicInt = 0

<<<<<<< HEAD
    /// Initializes new instance of `MainScheduler`.
    public init() {
=======
    private init() {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        _mainQueue = DispatchQueue.main
        super.init(serialQueue: _mainQueue)
    }

<<<<<<< HEAD
    /// Singleton instance of `MainScheduler`
    public static let instance = MainScheduler()

    /// Singleton instance of `MainScheduler` that always schedules work asynchronously
    /// and doesn't perform optimizations for calls scheduled from main queue.
    public static let asyncInstance = SerialDispatchQueueScheduler(serialQueue: DispatchQueue.main)

    /// In case this method is called on a background thread it will throw an exception.
    public class func ensureExecutingOnScheduler(errorMessage: String? = nil) {
        if !DispatchQueue.isMain {
=======
    /**
    Singleton instance of `MainScheduler`
    */
    public static let instance = MainScheduler()

    /**
    Singleton instance of `MainScheduler` that always schedules work asynchronously
    and doesn't perform optimizations for calls scheduled from main thread.
    */
    public static let asyncInstance = SerialDispatchQueueScheduler(serialQueue: DispatchQueue.main)

    /**
    In case this method is called on a background thread it will throw an exception.
    */
    public class func ensureExecutingOnScheduler(errorMessage: String? = nil) {
        if !Thread.current.isMainThread {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            rxFatalError(errorMessage ?? "Executing on backgound thread. Please use `MainScheduler.instance.schedule` to schedule work on main thread.")
        }
    }

    override func scheduleInternal<StateType>(_ state: StateType, action: @escaping (StateType) -> Disposable) -> Disposable {
        let currentNumberEnqueued = AtomicIncrement(&numberEnqueued)

<<<<<<< HEAD
        if DispatchQueue.isMain && currentNumberEnqueued == 1 {
=======
        if Thread.current.isMainThread && currentNumberEnqueued == 1 {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            let disposable = action(state)
            _ = AtomicDecrement(&numberEnqueued)
            return disposable
        }

        let cancel = SingleAssignmentDisposable()

        _mainQueue.async {
            if !cancel.isDisposed {
                _ = action(state)
            }

            _ = AtomicDecrement(&self.numberEnqueued)
        }

        return cancel
    }
}
