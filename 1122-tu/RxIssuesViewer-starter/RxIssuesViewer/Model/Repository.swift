//
//  Repository.swift
//  RxIssuesViewer
//
//  Created by Nikolas Burk on 21/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import Foundation

struct Repository {
  let identifier: Int?
  let language: String?
  let name: String?
  let fullName: String?
    
    
    init(json: [String:Any]){
        self.identifier = json["identifier"] as? Int
        self.language = json["language"] as? String
        self.name = json["name"] as? String
        self.fullName = json["full_name"] as? String
    }
}

