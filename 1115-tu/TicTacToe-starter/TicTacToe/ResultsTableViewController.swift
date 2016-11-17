//
//  ResultsTableViewController.swift
//  TicTacToe
//
//  Created by Nabil K on 2016-11-15.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ResultsTableViewController: UITableViewController {
    
    let boards: Variable<[Board]> = Variable([])
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = nil
        tableView.dataSource = nil
        
        boards.asObservable().bindTo(tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) {
            (row: Int, board:Board, cell:UITableViewCell) in
           
            if let winner = board.winner() {
                cell.textLabel!.text = "Winner  \(winner.rawValue)"
            }
            
            else{
              cell.textLabel!.text = board.playerWithCurrentTurn().rawValue
            }
        }.addDisposableTo(disposeBag)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let vc = segue.destination as? ViewController {
                vc.addBoard = { (board:Board) in
                    self.boards.value.append(board)
                    
                }
            }
    }
    
    
    


}
