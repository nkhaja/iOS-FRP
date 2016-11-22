//
//  UITextView+Rx.swift
//  RxCocoa
//
//  Created by Yuta ToKoRo on 7/19/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)

import Foundation
import UIKit
#if !RX_NO_MODULE
import RxSwift
#endif

    
    
extension UITextView {
    
<<<<<<< HEAD
    /// Factory method that enables subclasses to implement their own `delegate`.
    ///
    /// - returns: Instance of delegate proxy that wraps `delegate`.
=======
    /**
    Factory method that enables subclasses to implement their own `delegate`.
    
    - returns: Instance of delegate proxy that wraps `delegate`.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public override func createRxDelegateProxy() -> RxScrollViewDelegateProxy {
        return RxTextViewDelegateProxy(parentObject: self)
    }
}

extension Reactive where Base: UITextView {
<<<<<<< HEAD
    /// Reactive wrapper for `text` property.
    public var text: ControlProperty<String?> {
        let source: Observable<String?> = Observable.deferred { [weak textView = self.base] in
            let text = textView?.text
=======
    /**
    Reactive wrapper for `text` property.
    */
    public var text: ControlProperty<String> {
        let source: Observable<String> = Observable.deferred { [weak textView = self.base] in
            let text = textView?.text ?? ""
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            
            let textChanged = textView?.textStorage
                // This project uses text storage notifications because
                // that's the only way to catch autocorrect changes
                // in all cases. Other suggestions are welcome.
                .rx.didProcessEditingRangeChangeInLength
                // This observe on is here because text storage
                // will emit event while process is not completely done,
                // so rebinding a value will cause an exception to be thrown.
                .observeOn(MainScheduler.asyncInstance)
                .map { _ in
<<<<<<< HEAD
                    return textView?.textStorage.string
=======
                    return textView?.textStorage.string ?? ""
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
                }
                ?? Observable.empty()
            
            return textChanged
                .startWith(text)
        }

<<<<<<< HEAD
        let bindingObserver = UIBindingObserver(UIElement: self.base) { (textView, text: String?) in
=======
        let bindingObserver = UIBindingObserver(UIElement: self.base) { (textView, text: String) in
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            // This check is important because setting text value always clears control state
            // including marked text selection which is imporant for proper input 
            // when IME input method is used.
            if textView.text != text {
                textView.text = text
            }
        }
        
        return ControlProperty(values: source, valueSink: bindingObserver)
    }

<<<<<<< HEAD
    /// Reactive wrapper for `delegate` message.
    public var didBeginEditing: ControlEvent<()> {
       return ControlEvent<()>(events: self.delegate.methodInvoked(#selector(UITextViewDelegate.textViewDidBeginEditing(_:)))
=======
    /**
     Reactive wrapper for `delegate` message.
    */
    public var didBeginEditing: ControlEvent<()> {
       return ControlEvent<()>(events: self.delegate.observe(#selector(UITextViewDelegate.textViewDidBeginEditing(_:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            .map { a in
                return ()
            })
    }

<<<<<<< HEAD
    /// Reactive wrapper for `delegate` message.
    public var didEndEditing: ControlEvent<()> {
        return ControlEvent<()>(events: self.delegate.methodInvoked(#selector(UITextViewDelegate.textViewDidEndEditing(_:)))
=======
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didEndEditing: ControlEvent<()> {
        return ControlEvent<()>(events: self.delegate.observe(#selector(UITextViewDelegate.textViewDidEndEditing(_:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            .map { a in
                return ()
            })
    }

<<<<<<< HEAD
    /// Reactive wrapper for `delegate` message.
    public var didChange: ControlEvent<()> {
        return ControlEvent<()>(events: self.delegate.methodInvoked(#selector(UITextViewDelegate.textViewDidChange(_:)))
=======
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didChange: ControlEvent<()> {
        return ControlEvent<()>(events: self.delegate.observe(#selector(UITextViewDelegate.textViewDidChange(_:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            .map { a in
                return ()
            })
    }

<<<<<<< HEAD
    /// Reactive wrapper for `delegate` message.
    public var didChangeSelection: ControlEvent<()> {
        return ControlEvent<()>(events: self.delegate.methodInvoked(#selector(UITextViewDelegate.textViewDidChangeSelection(_:)))
=======
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didChangeSelection: ControlEvent<()> {
        return ControlEvent<()>(events: self.delegate.observe(#selector(UITextViewDelegate.textViewDidChangeSelection(_:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            .map { a in
                return ()
            })
    }

}

#endif
