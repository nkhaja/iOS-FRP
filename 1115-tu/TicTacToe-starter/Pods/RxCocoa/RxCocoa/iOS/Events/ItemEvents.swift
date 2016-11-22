//
//  ItemEvents.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 6/20/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation
<<<<<<< HEAD
#if os(iOS) || os(tvOS)
import UIKit

=======
import UIKit

#if os(iOS) || os(tvOS)
>>>>>>> 3cd23538aef0a97d0cb9d6a6347598c5f2cd57e5
public typealias ItemMovedEvent = (sourceIndex: IndexPath, destinationIndex: IndexPath)
public typealias WillDisplayCellEvent = (cell: UITableViewCell, indexPath: IndexPath)
public typealias DidEndDisplayingCellEvent = (cell: UITableViewCell, indexPath: IndexPath)
#endif
