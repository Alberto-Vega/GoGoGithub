//
//  JSONParser.swift
//  GoGoGithub
//
//  Created by Alberto Vega Gonzalez on 11/9/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation

class JSONParser {
//    
//    class func tokenFromJSONData(jsonData: NSData) -> String {
//        var token: String?
//        
//        do {
//
//                    
//if let user = rootObject["access_token"]as? String {
//    token =  user
//            }
//                } catch _ {}
//        
//    return token
//}



    class func reposInfoFromJSON(json: [[String : AnyObject]]) -> [Repository]? {
        
        var repositories = [Repository]()
        for repoDictionary in json {
            if let name = repoDictionary["name"] as? String,
                description = repoDictionary["description"] as? String,
                id = repoDictionary["id"] as? Int,
                createdAt = repoDictionary["created_at"] as? String,
                openIssues = repoDictionary["open_issues_count"] as? Int,
                url = repoDictionary["url"] as? String,
                language = repoDictionary["language"] as? String?,
                owner = repoDictionary["owner"] as? [String: AnyObject],
                login = owner["login"] as? String,
                avatarUrl = owner["avatar_url"] as? String,
                ownerId = owner["id"] as? Int,
                ownerUrl = owner["url"] as? String {
                
                let newOwner = Owner(login: login, avatarUrl: avatarUrl, id: ownerId, url: ownerUrl)
                    
                    //Create Git Repo object
                let newRepo = Repository(name: name, description: description, id: id, createdAt: createdAt, openIssues: openIssues, url: url, language: language, owner: newOwner)
                    
                    repositories.append(newRepo)
            }
            
            return repositories
            
        }
        return nil
    }
}
