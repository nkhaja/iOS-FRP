//
//  SearchUserViewController.swift
//  RxIssuesViewer
//
//  Created by Nabil K on 2016-11-22.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class SearchUserViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    let rxGitHub = RxGitHubAPI()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObservers()
        
        /*let userObservable: Observable<User?> =  searchTextField.rx.text.asObservable().throttle(3, scheduler:MainScheduler.instance).flatMapLatest{
            (searchText:String?) -> Observable<User?> in
            
            return self.rxGithub.getUser(for: searchText!)
            
            } */
        
 

        // Do any additional setup after loading the view.
    }
    
    func setupObservers(){
        let searchTextObservable: Observable<String?> = searchTextField.rx.text.asObservable()
        
        
        let userObservable: Observable<User?> = searchTextObservable.throttle(1, scheduler: MainScheduler.instance).flatMapLatest{ (searchText: String?) -> Observable<User?> in
            return self.rxGitHub.getUser(for: searchText!)
        }
        
        userObservable.subscribe {
            print($0)a
        }
    }

}
