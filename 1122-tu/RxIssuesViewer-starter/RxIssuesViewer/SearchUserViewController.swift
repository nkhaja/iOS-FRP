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
    @IBOutlet weak var githubNameLabel: UILabel!
    @IBOutlet weak var numReposLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var repoLabel: UILabel!
    
    let rxGitHub = RxGitHubAPI()
    let disposeBag = DisposeBag()
    var thisUser:User?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObservers()
    }
    
    func setupObservers(){
        let searchTextObservable: Observable<String?> = searchTextField.rx.text.asObservable()
        
        
        let userObservable: Observable<User?> = searchTextObservable.throttle(1, scheduler: MainScheduler.instance).flatMapLatest{ (searchText: String?) -> Observable<User?> in
            return self.rxGitHub.getUser(for: searchText!)
        }
        
        userObservable.map{ (user: User?) in
            return user?.login ?? ""
        }.bindTo(githubNameLabel.rx.text).addDisposableTo(disposeBag)
        
        
        userObservable.map{ (user: User?) in
            if let user = user{
                self.thisUser = user
                return String(describing: user.numRepos!)
            }
            else{
                
                return ""
            }
            }.bindTo(numReposLabel.rx.text).addDisposableTo(disposeBag)
        
        
        
//        
//        let repoObservable: Observable<[Repository]?> = userObservable.map { (user:User?) in
//            if let user = user{
//                return self.rxGitHub.getRepos(user: user)
//            }
//            
//            else{
//                return []
//            }
//        }
    }
    
        
//        userObservable.map{ (user: User?) in
//            if let user = user{
//                if user.type == "User"{
//                    return UIImage(named: "user")!
//                }
//                else if user.type == "Organization"{
//                    return UIImage(named: "organization")!
//                }
//            }
//            
//            else{
//                return UIImage(named: "user")!
//            }
//            }.bindTo(avatarImageView.rx.image).addDisposableTo(disposeBag)
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seeRepos"{
            if let seeReposVc = segue.destination as? SeeReposViewController{
                seeReposVc.user = self.thisUser
                
            }
        }
    }
    
    @IBAction func seeRepositoriesButton(_ sender: AnyObject) {
        performSegue(withIdentifier: "seeRepos", sender: self)
    }
    

}
