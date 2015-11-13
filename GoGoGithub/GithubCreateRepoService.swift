//
//  GithubCreateRepoService.swift
//  GoGoGithub
//
//  Created by Alberto Vega Gonzalez on 11/11/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation

let kCreateRepositoryEndPoint = "/user/repos"


class GithubCreateRepoService: APIRequest {
    
    var name: String
    init(name: String) {
        self.name = name
        
        super.init()
        self.httpMethod = .POST
    }
    
    override func url() -> String {
        return "https://api.github.com/user/repos"
    }
    
    override func queryStringParameters() -> [String : String]? {
        do {
            let accessToken =  try OAuthClient.shared.token!
            return ["access_token" : accessToken]
            
        } catch _ {}
        
        return nil
    }
    
    override func httpBody() -> NSData? {
        do {
            return try NSJSONSerialization.dataWithJSONObject(["name" : self.name], options: NSJSONWritingOptions.PrettyPrinted)
        } catch _ {}
        return nil
    }
}