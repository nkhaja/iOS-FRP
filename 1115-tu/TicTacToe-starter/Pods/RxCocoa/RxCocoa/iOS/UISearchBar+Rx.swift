//
//  UISearchBar+Rx.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 3/28/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif
import UIKit


#if os(iOS)
    extension UISearchBar {
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
        public func createRxDelegateProxy() -> RxSearchBarDelegateProxy {
            return RxSearchBarDelegateProxy(parentObject: self)
        }
        
    }
#endif

extension Reactive where Base: UISearchBar {

<<<<<<< HEAD
    /// Reactive wrapper for `delegate`.
    ///
    /// For more information take a look at `DelegateProxyType` protocol documentation.
=======
    /**
    Reactive wrapper for `delegate`.
    
    For more information take a look at `DelegateProxyType` protocol documentation.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var delegate: DelegateProxy {
        return RxSearchBarDelegateProxy.proxyForObject(base)
    }
    
<<<<<<< HEAD
    /// Reactive wrapper for `text` property.
    public var text: ControlProperty<String?> {
        let source: Observable<String?> = Observable.deferred { [weak searchBar = self.base as UISearchBar] () -> Observable<String?> in
            let text = searchBar?.text
            
            return (searchBar?.rx.delegate.methodInvoked(#selector(UISearchBarDelegate.searchBar(_:textDidChange:))) ?? Observable.empty())
                    .map { a in
                        return a[1] as? String
=======
    /**
    Reactive wrapper for `text` property.
    */
    public var text: ControlProperty<String> {
        let source: Observable<String> = Observable.deferred { [weak searchBar = self.base as UISearchBar] () -> Observable<String> in
            let text = searchBar?.text ?? ""
            
            return (searchBar?.rx.delegate.observe(#selector(UISearchBarDelegate.searchBar(_:textDidChange:))) ?? Observable.empty())
                    .map { a in
                        return a[1] as? String ?? ""
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
                    }
                    .startWith(text)
        }

<<<<<<< HEAD
        let bindingObserver = UIBindingObserver(UIElement: self.base) { (searchBar, text: String?) in
=======
        let bindingObserver = UIBindingObserver(UIElement: self.base) { (searchBar, text: String) in
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            searchBar.text = text
        }
        
        return ControlProperty(values: source, valueSink: bindingObserver)
    }
    
<<<<<<< HEAD
    /// Reactive wrapper for `selectedScopeButtonIndex` property.
=======
    /**
    Reactive wrapper for `selectedScopeButtonIndex` property.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var selectedScopeButtonIndex: ControlProperty<Int> {
        let source: Observable<Int> = Observable.deferred { [weak source = self.base as UISearchBar] () -> Observable<Int> in
            let index = source?.selectedScopeButtonIndex ?? 0
            
<<<<<<< HEAD
            return (source?.rx.delegate.methodInvoked(#selector(UISearchBarDelegate.searchBar(_:selectedScopeButtonIndexDidChange:))) ?? Observable.empty())
=======
            return (source?.rx.delegate.observe(#selector(UISearchBarDelegate.searchBar(_:selectedScopeButtonIndexDidChange:))) ?? Observable.empty())
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
                .map { a in
                    return try castOrThrow(Int.self, a[1])
                }
                .startWith(index)
        }
        
        let bindingObserver = UIBindingObserver(UIElement: self.base) { (searchBar, index: Int) in
            searchBar.selectedScopeButtonIndex = index
        }
        
        return ControlProperty(values: source, valueSink: bindingObserver)
    }
    
#if os(iOS)
<<<<<<< HEAD
    /// Reactive wrapper for delegate method `searchBarCancelButtonClicked`.
    public var cancelButtonClicked: ControlEvent<Void> {
        let source: Observable<Void> = self.delegate.methodInvoked(#selector(UISearchBarDelegate.searchBarCancelButtonClicked(_:)))
=======
    /**
    Reactive wrapper for delegate method `searchBarCancelButtonClicked`.
    */
    public var cancelButtonClicked: ControlEvent<Void> {
        let source: Observable<Void> = self.delegate.observe(#selector(UISearchBarDelegate.searchBarCancelButtonClicked(_:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            .map { _ in
                return ()
            }
        return ControlEvent(events: source)
    }

<<<<<<< HEAD
	/// Reactive wrapper for delegate method `searchBarBookmarkButtonClicked`.
	public var bookmarkButtonClicked: ControlEvent<Void> {
		let source: Observable<Void> = self.delegate.methodInvoked(#selector(UISearchBarDelegate.searchBarBookmarkButtonClicked(_:)))
=======
	/**
	Reactive wrapper for delegate method `searchBarBookmarkButtonClicked`.
	*/
	public var bookmarkButtonClicked: ControlEvent<Void> {
		let source: Observable<Void> = self.delegate.observe(#selector(UISearchBarDelegate.searchBarBookmarkButtonClicked(_:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
			.map { _ in
				return ()
			}
		return ControlEvent(events: source)
	}

<<<<<<< HEAD
	/// Reactive wrapper for delegate method `searchBarResultsListButtonClicked`.
	public var resultsListButtonClicked: ControlEvent<Void> {
		let source: Observable<Void> = self.delegate.methodInvoked(#selector(UISearchBarDelegate.searchBarResultsListButtonClicked(_:)))
=======
	/**
	Reactive wrapper for delegate method `searchBarResultsListButtonClicked`.
	*/
	public var resultsListButtonClicked: ControlEvent<Void> {
		let source: Observable<Void> = self.delegate.observe(#selector(UISearchBarDelegate.searchBarResultsListButtonClicked(_:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
			.map { _ in
				return ()
		}
		return ControlEvent(events: source)
	}
#endif
	
<<<<<<< HEAD
    /// Reactive wrapper for delegate method `searchBarSearchButtonClicked`.
    public var searchButtonClicked: ControlEvent<Void> {
        let source: Observable<Void> = self.delegate.methodInvoked(#selector(UISearchBarDelegate.searchBarSearchButtonClicked(_:)))
=======
    /**
     Reactive wrapper for delegate method `searchBarSearchButtonClicked`.
     */
    public var searchButtonClicked: ControlEvent<Void> {
        let source: Observable<Void> = self.delegate.observe(#selector(UISearchBarDelegate.searchBarSearchButtonClicked(_:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            .map { _ in
                return ()
        }
        return ControlEvent(events: source)
    }
	
<<<<<<< HEAD
	/// Reactive wrapper for delegate method `searchBarTextDidBeginEditing`.
	public var textDidBeginEditing: ControlEvent<Void> {
		let source: Observable<Void> = self.delegate.methodInvoked(#selector(UISearchBarDelegate.searchBarTextDidBeginEditing(_:)))
=======
	/**
	Reactive wrapper for delegate method `searchBarTextDidBeginEditing`.
	*/
	public var textDidBeginEditing: ControlEvent<Void> {
		let source: Observable<Void> = self.delegate.observe(#selector(UISearchBarDelegate.searchBarTextDidBeginEditing(_:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
			.map { _ in
				return ()
		}
		return ControlEvent(events: source)
	}
	
<<<<<<< HEAD
	/// Reactive wrapper for delegate method `searchBarTextDidEndEditing`.
	public var textDidEndEditing: ControlEvent<Void> {
		let source: Observable<Void> = self.delegate.methodInvoked(#selector(UISearchBarDelegate.searchBarTextDidEndEditing(_:)))
=======
	/**
	Reactive wrapper for delegate method `searchBarTextDidEndEditing`.
	*/
	public var textDidEndEditing: ControlEvent<Void> {
		let source: Observable<Void> = self.delegate.observe(#selector(UISearchBarDelegate.searchBarTextDidEndEditing(_:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
			.map { _ in
				return ()
		}
		return ControlEvent(events: source)
	}
	
}

#endif
