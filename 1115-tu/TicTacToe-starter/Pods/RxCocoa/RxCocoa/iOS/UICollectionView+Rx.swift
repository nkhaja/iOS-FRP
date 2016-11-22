//
//  UICollectionView+Rx.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 4/2/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif
import UIKit

// Items

extension Reactive where Base: UICollectionView {

    /**
    Binds sequences of elements to collection view items.
    
    - parameter source: Observable sequence of items.
    - parameter cellFactory: Transform between sequence elements and view cells.
    - returns: Disposable object that can be used to unbind.
     
     Example
    
         let items = Observable.just([
             1,
             2,
             3
         ])

         items
         .bindTo(collectionView.rx.items) { (collectionView, row, element) in
<<<<<<< HEAD
            let indexPath = IndexPath(row: row, section: 0)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NumberCell
=======
             let indexPath = IndexPath(forItem: row, inSection: 0)
             let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! NumberCell
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
             cell.value?.text = "\(element) @ \(row)"
             return cell
         }
         .addDisposableTo(disposeBag)
    */
    public func items<S: Sequence, O: ObservableType>
        (_ source: O)
        -> (_ cellFactory: @escaping (UICollectionView, Int, S.Iterator.Element) -> UICollectionViewCell)
        -> Disposable where O.E == S {
        return { cellFactory in
            let dataSource = RxCollectionViewReactiveArrayDataSourceSequenceWrapper<S>(cellFactory: cellFactory)
            return self.items(dataSource: dataSource)(source)
        }
        
    }
    
    /**
    Binds sequences of elements to collection view items.
    
    - parameter cellIdentifier: Identifier used to dequeue cells.
    - parameter source: Observable sequence of items.
    - parameter configureCell: Transform between sequence elements and view cells.
    - parameter cellType: Type of table view cell.
    - returns: Disposable object that can be used to unbind.
     
     Example

         let items = Observable.just([
             1,
             2,
             3
         ])

         items
             .bindTo(collectionView.rx.items(cellIdentifier: "Cell", cellType: NumberCell.self)) { (row, element, cell) in
                cell.value?.text = "\(element) @ \(row)"
             }
             .addDisposableTo(disposeBag)
    */
    public func items<S: Sequence, Cell: UICollectionViewCell, O : ObservableType>
        (cellIdentifier: String, cellType: Cell.Type = Cell.self)
        -> (_ source: O)
        -> (_ configureCell: @escaping (Int, S.Iterator.Element, Cell) -> Void)
        -> Disposable where O.E == S {
        return { source in
            return { configureCell in
                let dataSource = RxCollectionViewReactiveArrayDataSourceSequenceWrapper<S> { (cv, i, item) in
                    let indexPath = IndexPath(item: i, section: 0)
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! Cell
                    configureCell(i, item, cell)
                    return cell
                }
                    
                return self.items(dataSource: dataSource)(source)
            }
        }
    }

    
    /**
    Binds sequences of elements to collection view items using a custom reactive data used to perform the transformation.
    
    - parameter dataSource: Data source used to transform elements to view cells.
    - parameter source: Observable sequence of items.
    - returns: Disposable object that can be used to unbind.
     
     Example
     
         let dataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<String, Double>>()

         let items = Observable.just([
             SectionModel(model: "First section", items: [
                 1.0,
                 2.0,
                 3.0
             ]),
             SectionModel(model: "Second section", items: [
                 1.0,
                 2.0,
                 3.0
             ]),
             SectionModel(model: "Third section", items: [
                 1.0,
                 2.0,
                 3.0
             ])
         ])

         dataSource.configureCell = { (dataSource, cv, indexPath, element) in
<<<<<<< HEAD
             let cell = cv.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NumberCell
=======
             let cell = cv.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! NumberCell
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
             cell.value?.text = "\(element) @ row \(indexPath.row)"
             return cell
         }

         items
            .bindTo(collectionView.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)
    */
    public func items<
            DataSource: RxCollectionViewDataSourceType & UICollectionViewDataSource,
            O: ObservableType>
        (dataSource: DataSource)
        -> (_ source: O)
        -> Disposable where DataSource.Element == O.E
          {
        return { source in
            // This is called for sideeffects only, and to make sure delegate proxy is in place when
            // data source is being bound.
            // This is needed because theoretically the data source subscription itself might
<<<<<<< HEAD
            // call `self.rx.delegate`. If that happens, it might cause weird side effects since
=======
            // call `self.rx_delegate`. If that happens, it might cause weird side effects since
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            // setting data source will set delegate, and UICollectionView might get into a weird state.
            // Therefore it's better to set delegate proxy first, just to be sure.
            _ = self.delegate
            // Strong reference is needed because data source is in use until result subscription is disposed
            return source.subscribeProxyDataSource(ofObject: self.base, dataSource: dataSource, retainDataSource: true) { [weak collectionView = self.base] (_: RxCollectionViewDataSourceProxy, event) -> Void in
                guard let collectionView = collectionView else {
                    return
                }
                dataSource.collectionView(collectionView, observedEvent: event)
            }
        }
    }
}

extension UICollectionView {
   
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
        return RxCollectionViewDelegateProxy(parentObject: self)
    }

<<<<<<< HEAD
    /// Factory method that enables subclasses to implement their own `rx.dataSource`.
    ///
    /// - returns: Instance of delegate proxy that wraps `dataSource`.
=======
    /**
     Factory method that enables subclasses to implement their own `rx.dataSource`.

     - returns: Instance of delegate proxy that wraps `dataSource`.
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func createRxDataSourceProxy() -> RxCollectionViewDataSourceProxy {
        return RxCollectionViewDataSourceProxy(parentObject: self)
    }

}

extension Reactive where Base: UICollectionView {

<<<<<<< HEAD
    /// Reactive wrapper for `dataSource`.
    ///
    /// For more information take a look at `DelegateProxyType` protocol documentation.
=======
    /**
    Reactive wrapper for `dataSource`.
    
    For more information take a look at `DelegateProxyType` protocol documentation.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public var dataSource: DelegateProxy {
        return RxCollectionViewDataSourceProxy.proxyForObject(base)
    }
    
<<<<<<< HEAD
    /// Installs data source as forwarding delegate on `rx.dataSource`.
    /// Data source won't be retained.
    ///
    /// It enables using normal delegate mechanism with reactive delegate mechanism.
    ///
    /// - parameter dataSource: Data source object.
    /// - returns: Disposable object that can be used to unbind the data source.
=======
    /**
    Installs data source as forwarding delegate on `rx.dataSource`. 
    Data source won't be retained.
    
    It enables using normal delegate mechanism with reactive delegate mechanism.
    
    - parameter dataSource: Data source object.
    - returns: Disposable object that can be used to unbind the data source.
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func setDataSource(_ dataSource: UICollectionViewDataSource)
        -> Disposable {
        return RxCollectionViewDataSourceProxy.installForwardDelegate(dataSource, retainDelegate: false, onProxyForObject: self.base)
    }
   
<<<<<<< HEAD
    /// Reactive wrapper for `delegate` message `collectionView:didSelectItemAtIndexPath:`.
    public var itemSelected: ControlEvent<IndexPath> {
        let source = delegate.methodInvoked(#selector(UICollectionViewDelegate.collectionView(_:didSelectItemAt:)))
=======
    /**
    Reactive wrapper for `delegate` message `collectionView:didSelectItemAtIndexPath:`.
    */
    public var itemSelected: ControlEvent<IndexPath> {
        let source = delegate.observe(#selector(UICollectionViewDelegate.collectionView(_:didSelectItemAt:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            .map { a in
                return a[1] as! IndexPath
            }
        
        return ControlEvent(events: source)
    }

<<<<<<< HEAD
    /// Reactive wrapper for `delegate` message `collectionView:didSelectItemAtIndexPath:`.
    public var itemDeselected: ControlEvent<IndexPath> {
        let source = delegate.methodInvoked(#selector(UICollectionViewDelegate.collectionView(_:didDeselectItemAt:)))
=======
    /**
     Reactive wrapper for `delegate` message `collectionView:didSelectItemAtIndexPath:`.
     */
    public var itemDeselected: ControlEvent<IndexPath> {
        let source = delegate.observe(#selector(UICollectionViewDelegate.collectionView(_:didDeselectItemAt:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            .map { a in
                return a[1] as! IndexPath
        }

        return ControlEvent(events: source)
    }

<<<<<<< HEAD
    /// Reactive wrapper for `delegate` message `collectionView:didSelectItemAtIndexPath:`.
    ///
    /// It can be only used when one of the `rx.itemsWith*` methods is used to bind observable sequence,
    /// or any other data source conforming to `SectionedViewDataSourceType` protocol.
    ///
    /// ```
    ///     collectionView.rx.modelSelected(MyModel.self)
    ///        .map { ...
    /// ```
=======
    /**
    Reactive wrapper for `delegate` message `collectionView:didSelectItemAtIndexPath:`.

    It can be only used when one of the `rx.itemsWith*` methods is used to bind observable sequence,
    or any other data source conforming to `SectionedViewDataSourceType` protocol.
    
     ```
         collectionView.rx.modelSelected(MyModel.self)
            .map { ...
     ```
    */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func modelSelected<T>(_ modelType: T.Type) -> ControlEvent<T> {
        let source: Observable<T> = itemSelected.flatMap { [weak view = self.base as UICollectionView] indexPath -> Observable<T> in
            guard let view = view else {
                return Observable.empty()
            }

<<<<<<< HEAD
            return Observable.just(try view.rx.model(at: indexPath))
=======
            return Observable.just(try view.rx.model(indexPath))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        }
        
        return ControlEvent(events: source)
    }

<<<<<<< HEAD
    /// Reactive wrapper for `delegate` message `collectionView:didSelectItemAtIndexPath:`.
    ///
    /// It can be only used when one of the `rx.itemsWith*` methods is used to bind observable sequence,
    /// or any other data source conforming to `SectionedViewDataSourceType` protocol.
    ///
    /// ```
    ///     collectionView.rx.modelDeselected(MyModel.self)
    ///        .map { ...
    /// ```
=======
    /**
     Reactive wrapper for `delegate` message `collectionView:didSelectItemAtIndexPath:`.

     It can be only used when one of the `rx.itemsWith*` methods is used to bind observable sequence,
     or any other data source conforming to `SectionedViewDataSourceType` protocol.

     ```
         collectionView.rx.modelDeselected(MyModel.self)
            .map { ...
     ```
     */
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
    public func modelDeselected<T>(_ modelType: T.Type) -> ControlEvent<T> {
        let source: Observable<T> = itemDeselected.flatMap { [weak view = self.base as UICollectionView] indexPath -> Observable<T> in
            guard let view = view else {
                return Observable.empty()
            }

<<<<<<< HEAD
            return Observable.just(try view.rx.model(at: indexPath))
=======
            return Observable.just(try view.rx.model(indexPath))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
        }

        return ControlEvent(events: source)
    }
    
<<<<<<< HEAD
    /// Syncronous helper method for retrieving a model at indexPath through a reactive data source
    public func model<T>(at indexPath: IndexPath) throws -> T {
        let dataSource: SectionedViewDataSourceType = castOrFatalError(self.dataSource.forwardToDelegate(), message: "This method only works in case one of the `rx.itemsWith*` methods was used.")
        
        let element = try dataSource.model(at: indexPath)
=======
    /**
    Syncronous helper method for retrieving a model at indexPath through a reactive data source
    */
    public func model<T>(_ indexPath: IndexPath) throws -> T {
        let dataSource: SectionedViewDataSourceType = castOrFatalError(self.dataSource.forwardToDelegate(), message: "This method only works in case one of the `rx.itemsWith*` methods was used.")
        
        let element = try dataSource.model(indexPath)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5

        return element as! T
    }
}
#endif

#if os(tvOS)

extension Reactive where Base: UICollectionView {
    
<<<<<<< HEAD
    /// Reactive wrapper for `delegate` message `collectionView:didUpdateFocusInContext:withAnimationCoordinator:`.
    public var didUpdateFocusInContextWithAnimationCoordinator: ControlEvent<(context: UIFocusUpdateContext, animationCoordinator: UIFocusAnimationCoordinator)> {

        let source = delegate.methodInvoked(#selector(UICollectionViewDelegate.collectionView(_:didUpdateFocusIn:with:)))
=======
    /**
     Reactive wrapper for `delegate` message `collectionView:didUpdateFocusInContext:withAnimationCoordinator:`.
     */
    public var didUpdateFocusInContextWithAnimationCoordinator: ControlEvent<(context: UIFocusUpdateContext, animationCoordinator: UIFocusAnimationCoordinator)> {
        
        let source = delegate.observe(#selector(UICollectionViewDelegate.collectionView(_:didUpdateFocusIn:with:)))
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
            .map { a -> (context: UIFocusUpdateContext, animationCoordinator: UIFocusAnimationCoordinator) in
                let context = a[1] as! UIFocusUpdateContext
                let animationCoordinator = a[2] as! UIFocusAnimationCoordinator
                return (context: context, animationCoordinator: animationCoordinator)
<<<<<<< HEAD
            }
=======
        }
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5

        return ControlEvent(events: source)
    }
}
#endif
<<<<<<< HEAD
=======

#if os(iOS) || os(tvOS)

extension UICollectionView {

    /**
    Binds sequences of elements to collection view items.
    
    - parameter cellIdentifier: Identifier used to dequeue cells.
    - parameter source: Observable sequence of items.
    - parameter configureCell: Transform between sequence elements and view cells.
    - parameter cellType: Type of table view cell.
    - returns: Disposable object that can be used to unbind.
     
     Example

         let items = Observable.just([
             1,
             2,
             3
         ])

         items
             .bindTo(collectionView.rx.items(cellIdentifier: "Cell", cellType: NumberCell.self)) { (row, element, cell) in
                cell.value?.text = "\(element) @ \(row)"
             }
             .addDisposableTo(disposeBag)
    */
    @available(*, deprecated, renamed: "rx.items(cellIdentifier:cellType:_:_:)")
    public func rx_itemsWithCellIdentifier<S: Sequence, Cell: UICollectionViewCell, O : ObservableType>
        (_ cellIdentifier: String, cellType: Cell.Type = Cell.self)
        -> (_ source: O)
        -> (_ configureCell: @escaping (Int, S.Iterator.Element, Cell) -> Void)
        -> Disposable where O.E == S {
        return { source in
            return { configureCell in
                return self.rx.items(cellIdentifier: cellIdentifier, cellType: cellType)(source)(configureCell)
            }
        }
    }

    
    /**
    Binds sequences of elements to collection view items.
    
    - parameter source: Observable sequence of items.
    - parameter cellFactory: Transform between sequence elements and view cells.
    - returns: Disposable object that can be used to unbind.
     
     Example
    
         let items = Observable.just([
             1,
             2,
             3
         ])

         items
         .bindTo(collectionView.rx.items) { (collectionView, row, element) in
             let indexPath = IndexPath(forItem: row, inSection: 0)
             let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! NumberCell
             cell.value?.text = "\(element) @ \(row)"
             return cell
         }
         .addDisposableTo(disposeBag)
    */
    @available(*, deprecated, renamed: "rx.items(_:_:)")
    public func rx_itemsWithCellFactory<S: Sequence, O: ObservableType>
        (_ source: O)
        -> (_ cellFactory: @escaping (UICollectionView, Int, S.Iterator.Element) -> UICollectionViewCell)
        -> Disposable where O.E == S {
        return { cellFactory in
            return self.rx.items(source)(cellFactory)
        }
    }

    /**
    Binds sequences of elements to collection view items using a custom reactive data used to perform the transformation.
    
    - parameter dataSource: Data source used to transform elements to view cells.
    - parameter source: Observable sequence of items.
    - returns: Disposable object that can be used to unbind.
     
     Example
     
         let dataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<String, Double>>()

         let items = Observable.just([
             SectionModel(model: "First section", items: [
                 1.0,
                 2.0,
                 3.0
             ]),
             SectionModel(model: "Second section", items: [
                 1.0,
                 2.0,
                 3.0
             ]),
             SectionModel(model: "Third section", items: [
                 1.0,
                 2.0,
                 3.0
             ])
         ])

         dataSource.configureCell = { (dataSource, cv, indexPath, element) in
             let cell = cv.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! NumberCell
             cell.value?.text = "\(element) @ row \(indexPath.row)"
             return cell
         }

         items
            .bindTo(collectionView.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)
    */
    @available(*, deprecated, renamed: "rx.items(dataSource:_:)")
    public func rx_itemsWithDataSource<
            DataSource: RxCollectionViewDataSourceType & UICollectionViewDataSource,
            O: ObservableType>
        (_ dataSource: DataSource)
        -> (_ source: O)
        -> Disposable where DataSource.Element == O.E
          {
        return { source in
            return self.rx.items(dataSource: dataSource)(source)
        }
    }

    /**
     Syncronous helper method for retrieving a model at indexPath through a reactive data source
     */
    @available(*, deprecated, renamed: "rx.model(_:)")
    public func model<T>(_ indexPath: IndexPath) throws -> T {
        return try self.rx.model(indexPath)
    }
}
#endif
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
