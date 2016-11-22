//
//  SectionedViewDataSourceType.swift
<<<<<<< HEAD
//  RxCocoa
=======
//  Rx
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
//
//  Created by Krunoslav Zaher on 1/10/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

import Foundation

<<<<<<< HEAD
/// Data source with access to underlying sectioned model.
public protocol SectionedViewDataSourceType {
    /// Returns model at index path.
    ///
    /// In case data source doesn't contain any sections when this method is being called, `RxCocoaError.ItemsNotYetBound(object: self)` is thrown.

    /// - parameter indexPath: Model index path
    /// - returns: Model at index path.
    func model(at indexPath: IndexPath) throws -> Any
=======
/**
Data source with access to underlying sectioned model.
*/
public protocol SectionedViewDataSourceType {
    /**
     Returns model at index path.
     
     In case data source doesn't contain any sections when this method is being called, `RxCocoaError.ItemsNotYetBound(object: self)` is thrown.

     - parameter indexPath: Model index path 
     - returns: Model at index path.
    */
    func model(_ indexPath: IndexPath) throws -> Any
}

extension SectionedViewDataSourceType {
    /**
     Returns model at index path.

     In case data source doesn't contain any sections when this method is being called, `RxCocoaError.ItemsNotYetBound(object: self)` is thrown.

     - parameter indexPath: Model index path
     - returns: Model at index path.
     */
    @available(*, deprecated, renamed: "model(_:)")
    func modelAtIndexPath(_ indexPath: IndexPath) throws -> Any {
        return try self.model(indexPath)
    }
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
}
