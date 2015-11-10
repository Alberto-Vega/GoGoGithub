////
////  GithubService.swift
////  GoGoGithub
////
////  Created by Alberto Vega Gonzalez on 11/9/15.
////  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
////

import Foundation

class GithubService {
    
    static let sharedService = GithubService()
    
    class func searchWithTerm(term: String, completion: (success: Bool, json: [[String:AnyObject]]?) -> ()) {
        
        let token = OAuthClient.shared.token
        
        guard let url = NSURL(string: "https://api.github.com/search/repositories?q=term") else {return completion(success: false, json: nil)}
        
        let request = NSMutableURLRequest(URL: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let error = error {
                print(error.description)
                return completion(success: false, json: nil)
                
            }
            if let data = data {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
                    if let json = json as? [[String:AnyObject]]{
                        return completion(success: true,json: json)
                    } else {
                        return completion(success: false,json: nil)
                    }
                    print(json)
                } catch _ {
                    return completion(success: false,json: nil)
                }
            }
        }
        // This is the official URL, use it. This will work.
        // https://api.github.com/search/repositories?q=term
        
    }
}