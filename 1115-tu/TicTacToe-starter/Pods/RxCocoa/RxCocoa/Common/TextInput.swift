//
//  TextInput.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 5/12/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
#if !RX_NO_MODULE
    import RxSwift
#endif

#if os(iOS) || os(tvOS)
    import UIKit

    /// Represents text input with reactive extensions.
    public struct TextInput<Base: UITextInput> {
        /// Base text input to extend.
        public let base: Base

        /// Reactive wrapper for `text` property.
        public let text: ControlProperty<String?>

        /// Initializes new text input.
        ///
        /// - parameter base: Base object.
        /// - parameter text: Textual control property.
        public init(base: Base, text: ControlProperty<String?>) {
=======
#if os(iOS) || os(tvOS)
    import UIKit

    /**
    Represents text input with reactive extensions.
    */
    public struct TextInput<Base: UITextInput> {
        /**
         Base text input to extend.
        */
        public let base: Base

        /**
         Reactive wrapper for `text` property.
        */
        public let text: ControlProperty<String>

        /**
         Initializes new text input.
         
         - parameter base: Base object.
         - parameter text: Textual control property.
        */
        public init(base: Base, text: ControlProperty<String>) {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            self.base = base
            self.text = text
        }
    }

    extension Reactive where Base: UITextField {
<<<<<<< HEAD
        /// Reactive text input.
        public var textInput: TextInput<Base> {
=======
        /**
         Reactive text input.
        */
        public var textInput: TextInput<UITextField> {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            return TextInput(base: base, text: self.text)
        }
    }

    extension Reactive where Base: UITextView {
<<<<<<< HEAD
        /// Reactive text input.
        public var textInput: TextInput<Base> {
=======
        /**
         Reactive text input.
         */
        public var textInput: TextInput<UITextView> {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            return TextInput(base: base, text: self.text)
        }
    }

<<<<<<< HEAD
#endif

#if os(macOS)
    import Cocoa

    /// Represents text input with reactive extensions.
    public struct TextInput<Base: NSTextInputClient> {
        /// Base text input to extend.
        public let base: Base

        /// Reactive wrapper for `text` property.
        public let text: ControlProperty<String?>

        /// Initializes new text input.
        ///
        /// - parameter base: Base object.
        /// - parameter text: Textual control property.
        public init(base: Base, text: ControlProperty<String?>) {
=======
    /**
     Represents text input with reactive extensions.
     */
    @available(*, deprecated, renamed: "TextInput")
    public protocol RxTextInput : UITextInput {
        @available(*, deprecated, renamed: "rx.textInput.text")
        var rx_text: ControlProperty<String> { get }
    }

    extension UITextField : RxTextInput {
        @available(*, deprecated, renamed: "rx.textInput.text")
        public var rx_text: ControlProperty<String> {
            return self.rx.text
        }
    }

    extension UITextView : RxTextInput {
        @available(*, deprecated, renamed: "rx.textInput.text")
        public var rx_text: ControlProperty<String> {
            return self.rx.text
        }
    }


#endif

#if os(OSX)
    import Cocoa

    /**
     Represents text input with reactive extensions.
     */
    public struct TextInput<Base: NSTextInput> {
        /**
         Base text input to extend.
         */
        public let base: Base

        /**
         Reactive wrapper for `text` property.
         */
        public let text: ControlProperty<String>

        /**
         Initializes new text input.

         - parameter base: Base object.
         - parameter text: Textual control property.
         */
        public init(base: Base, text: ControlProperty<String>) {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            self.base = base
            self.text = text
        }
    }

<<<<<<< HEAD
    extension Reactive where Base: NSTextField, Base: NSTextInputClient {
        /// Reactive text input.
        public var textInput: TextInput<Base> {
=======
    extension Reactive where Base: NSTextField {
        /**
         Reactive text input.
         */
        public var textInput: TextInput<NSTextField> {
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            return TextInput(base: base, text: self.text)
        }
    }

<<<<<<< HEAD
=======
    /**
    Represents text input with reactive extensions.
    */
    @available(*, deprecated, renamed: "TextInput")
    public protocol RxTextInput : NSTextInput {
        
        /**
         Reactive wrapper for `text` property.
        */
        @available(*, deprecated, renamed: "rx.textInput.text")
        var rx_text: ControlProperty<String> { get }
    }

    @available(*, deprecated)
    extension NSTextField : RxTextInput {
        /**
         Reactive wrapper for `text` property.
         */
        @available(*, deprecated, renamed: "rx.textInput.text")
        public var rx_text: ControlProperty<String> {
            return self.rx.text
        }
    }

>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
#endif


