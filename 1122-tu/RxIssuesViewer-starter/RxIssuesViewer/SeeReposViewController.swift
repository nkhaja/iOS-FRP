//
//  SeeReposViewController.swift
//  
//
//  Created by Nabil K on 2016-12-01.
//
//


import UIKit
import RxCocoa
import RxSwift

import UIKit




class SeeReposViewController: UIViewController {
    var user:User?
    let rxGitHub = RxGitHubAPI()
    let disposeBag = DisposeBag()
    var repositories: Variable<[Repository]>
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = nil
        tableView.dataSource = nil
        
        let repoObservable:Observable<[Repository]> = rxGitHub.getRepos(user: self.user!)
        
        repoObservable.bindTo(self.tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) {
            (row: Int, repo: Repository, cell: UITableViewCell) in
            
            if let repoName = repo.fullName{
                cell.textLabel!.text = repoName
            }
            }.addDisposableTo(disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let issuesTableViewController = segue.destination as! IssuesViewController
        issuesTableViewController.user = user
        let selectedRow = tableView.indexPathForSelectedRow!.row
        issuesTableViewController.repository = //repoObser.value[selectedRow]
    }


    


}
