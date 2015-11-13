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
                if let response = response as? NSHTTPURLResponse {
                    if response.statusCode == 200 && error == nil {
                        if let data = data {
                            do {
                                
                                let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
                                
                                if let items = json["items"] as? [[String : AnyObject]] {
                                    
                                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                                        JSONParser.reposInfoFromJSON(items)
                                    })
                                }
                                
                            } catch let error {
                                
                                print(error)
                                
                            }
                        }
                    }
                }
            }.resume()
        }
    }
}