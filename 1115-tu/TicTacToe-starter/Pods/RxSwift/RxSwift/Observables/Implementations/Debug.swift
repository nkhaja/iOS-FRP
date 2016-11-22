//
//  Debug.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 5/2/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

let dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"

func logEvent(_ identifier: String, dateFormat: DateFormatter, content: String) {
    print("\(dateFormat.string(from: Date())): \(identifier) -> \(content)")
}

class DebugSink<Source: ObservableType, O: ObserverType> : Sink<O>, ObserverType where O.E == Source.E {
    typealias Element = O.E
    typealias Parent = Debug<Source>
    
    private let _parent: Parent
    private let _timestampFormatter = DateFormatter()
    
<<<<<<< HEAD
    init(parent: Parent, observer: O, cancel: Cancelable) {
=======
    init(parent: Parent, observer: O) {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        _parent = parent
        _timestampFormatter.dateFormat = dateFormat

        logEvent(_parent._identifier, dateFormat: _timestampFormatter, content: "subscribed")

<<<<<<< HEAD
        super.init(observer: observer, cancel: cancel)
=======
        super.init(observer: observer)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
    
    func on(_ event: Event<Element>) {
        let maxEventTextLength = 40
        let eventText = "\(event)"
<<<<<<< HEAD

        let eventNormalized = (eventText.characters.count > maxEventTextLength) && _parent._trimOutput
=======
        let eventNormalized = eventText.characters.count > maxEventTextLength
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            ? String(eventText.characters.prefix(maxEventTextLength / 2)) + "..." + String(eventText.characters.suffix(maxEventTextLength / 2))
            : eventText

        logEvent(_parent._identifier, dateFormat: _timestampFormatter, content: "Event \(eventNormalized)")

        forwardOn(event)
        if event.isStopEvent {
            dispose()
        }
    }
    
    override func dispose() {
<<<<<<< HEAD
        if !self.disposed {
            logEvent(_parent._identifier, dateFormat: _timestampFormatter, content: "isDisposed")
        }
=======
        logEvent(_parent._identifier, dateFormat: _timestampFormatter, content: "isDisposed")
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        super.dispose()
    }
}

class Debug<Source: ObservableType> : Producer<Source.E> {
    fileprivate let _identifier: String
<<<<<<< HEAD
    fileprivate let _trimOutput: Bool
    fileprivate let _source: Source

    init(source: Source, identifier: String?, trimOutput: Bool, file: String, line: UInt, function: String) {
        _trimOutput = trimOutput
=======
    
    fileprivate let _source: Source

    init(source: Source, identifier: String?, file: String, line: UInt, function: String) {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        if let identifier = identifier {
            _identifier = identifier
        }
        else {
            let trimmedFile: String
            if let lastIndex = file.lastIndexOf("/") {
                trimmedFile = file[file.index(after: lastIndex) ..< file.endIndex]
            }
            else {
                trimmedFile = file
            }
            _identifier = "\(trimmedFile):\(line) (\(function))"
        }
        _source = source
    }
    
<<<<<<< HEAD
    override func run<O: ObserverType>(_ observer: O, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where O.E == Source.E {
        let sink = DebugSink(parent: self, observer: observer, cancel: cancel)
        let subscription = _source.subscribe(sink)
        return (sink: sink, subscription: subscription)
=======
    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == Source.E {
        let sink = DebugSink(parent: self, observer: observer)
        sink.disposable = _source.subscribe(sink)
        return sink
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    }
}
