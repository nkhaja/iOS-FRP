//
//  RxGitHubAPI.swift
//  RxIssuesView
//
//  Created by Nikolas Burk on 21/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//
//  inspired by Octokit.swift

import Foundation
import RxSwift
import RxCocoa

class RxGitHubAPI {
    
    
    static private let clientID = "f3839012244786c67124"
    static private let clientSecret = "dd040a8563173dd6642e4a1819a34f7d958496f6"
    static private var userAccessToken = ""
    
    let baseURL = "https://api.github.com"
    static let githubWebURL = "https://github.com"
    
    enum GitHubEndpoint {
        case user(String)
        case organization(String)
        case repos(User)
        case issues(User, Repository)
    }
    
    func getUser(for userSearch: String) -> Observable<User?> {
       
        guard let url: URL = url(for: .user(userSearch))
            
        else {
            return Observable<User?>.just(nil)
        }
        
        
        let jsonObservable: Observable<Any> = URLSession.shared.rx.json(url: url)
        
        let userInfoObservable: Observable<[String:Any]?> = jsonObservable.map { (json: Any) in
            
            print("here we go")
            print(json as? [String:Any])
            return (json as? [String: Any])
        }
        
      
        
        let userObservable: Observable<User?> = userInfoObservable.map{ (userInfo:[String:Any]?) in
            if let userInfo = userInfo{
                return self.jsonToUser(json: userInfo)
            }
            return nil
        }
        return userObservable.observeOn(MainScheduler.instance).catchErrorJustReturn(nil)
    }
    
    func getRepos(user:User) -> Observable<[Repository]>{
        guard let url: URL = url(for: .repos(user))
        else{
            return Observable<[Repository]>.just([])
        }
        
        let jsonObservable: Observable<Any> = URLSession.shared.rx.json(url: url)
        
        let repoInfoObservable: Observable<[Any]?> = jsonObservable.map { (json: Any) in

            return (json as? [Any])
        }
        
        let repoObservable: Observable<[Repository]> = repoInfoObservable.map{ (repoInfo:[Any]?) in
            if let repoInfo = repoInfo {
                return self.jsonToRepo(json: repoInfo)
            }
            return []
        }
        return repoObservable.observeOn(MainScheduler.instance).catchErrorJustReturn([])
        
    }
    




    
    
    
    
    // MARK: Authentication
    
    static func authenticate(with code: String) {
        
        let path = "login/oauth/access_token"
        let params = ["client_id": clientID, "client_secret": clientSecret, "code": code]
        
        let urlString = githubWebURL + "/" + path + "?" + params.toURLArguments()
        
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    print(#file.lastPathComponent()!, #line, #function, "ERROR: no token, code \(response.statusCode)")
                    return
                } else {
                    if let data = data, let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as? String {
                        let accessToken = string.retrieveAccessToken()
                        if let accessToken = accessToken {
                            print(#file.lastPathComponent()!, #line, #function, "received access token: \(accessToken)")
                            userAccessToken = accessToken
                        }
                        else {
                            print(#file.lastPathComponent()!, #line, #function, "ERROR: could not get access token, code \(response.statusCode)")
                        }
                    }
                    else {
                        print(#file.lastPathComponent()!, #line, #function, "ERROR: could not parse data, code \(response.statusCode)")
                    }
                }
            }
        }
        task.resume()
    }
    
    static func loginURL() -> String {
        let baseURL = "https://github.com/login/oauth/authorize"
        let callback = "rxissuesviewer://success"
        let scope = "user%20repo"
        let urlString = baseURL + "?client_id=\(clientID)&redirect_url=\(callback)&scope=\(scope)" //
        return urlString
    }
    
    
    // MARK: URLs
    
    func url(for endpoint: GitHubEndpoint) -> URL? {
        var urlString = baseURL
        switch endpoint {
        case .user(let username):
            urlString = urlString + "/users/" + username
            if RxGitHubAPI.userAccessToken.characters.count > 0 {
                urlString = urlString + "?access_token=" + RxGitHubAPI.userAccessToken
            }
        case .organization(let organizationName):
            urlString = urlString + "/orgs/" + organizationName
            if RxGitHubAPI.userAccessToken.characters.count > 0 {
                urlString = urlString + "?access_token=" + RxGitHubAPI.userAccessToken
            }
        case .repos(let user):
            urlString = urlString + "/users/" + user.login! + "/repos"
            if RxGitHubAPI.userAccessToken.characters.count > 0 {
                urlString = urlString + "?access_token=" + RxGitHubAPI.userAccessToken
            }
        case .issues(let user, let repository):
            urlString = urlString + "/repos/" + user.login! + "/" + String(describing: repository.name) + "/issues?state=all"
            if RxGitHubAPI.userAccessToken.characters.count > 0 {
                urlString = urlString + "&access_token=" + RxGitHubAPI.userAccessToken
            }
        }
        return URL(string: urlString)
    }
    
    
    // MARK: Helpers
    func jsonToUser(json: [String:Any]) -> User? {
        var name:String? = "not found"
        var numRepos:Int? = 0
        var login: String? = "not found"
        var identifier:Int? = 0
        var email:String? = "not found"
        var type:String? = ""
        
        if let nameData = json["name"]{
            name = nameData as? String
        }
        
        if let numReposData = json["public_repos"]{
             numRepos = numReposData as? Int
        }
        
        if let loginData = json["login"]{
             login = loginData as? String
        }
        
        if let identifierData = json["id"]{
             identifier = identifierData as? Int
        }
        
        if let emailData = json["email"]{
            email = emailData as? String
        }
        
        if let typeData = json["type"]{
            type = typeData as? String
        }
        
        let newUser = User(identifier: identifier, login: login, name: name, email: email, numRepos: numRepos, type:type)
        
        
        
        return newUser
        
    }
    
    func jsonToRepo(json: [Any]) -> [Repository]{
        var allRepos:[Repository] = []
        
        for r in json {
            let repoData = r as? [String:Any]
            let newRepo: Repository = Repository(json:repoData!)
            if newRepo.name != nil{
                allRepos.append(newRepo)
            }
        }
        return allRepos
    }

}










