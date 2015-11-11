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
        
        if let token = OAuthClient.shared.token {
            guard let url = NSURL(string: "https://api.github.com/search/repositories?q=\(term)&access_token=\(token)") else {return}
            
            let request = NSMutableURLRequest(URL: url)
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
                
                if let _ = error {
                    completion(success: false, json: nil)
                }
                
                if let data = data {
                    
                    do {
                        
                        if let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? [String : AnyObject] {
                            
                            if let items = json["items"] as? [[String : AnyObject]] {
                                completion(success: true, json: items)
                            }

                            
                        }
                    } catch _ {
                        
                        return completion(success: false,json: nil)
                    }
                }
            }.resume()
        }
    }
}