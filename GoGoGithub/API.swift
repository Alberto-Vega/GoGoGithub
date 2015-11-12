//
//  API.swift
//  GoGoGithub
//
//  Created by Alberto Vega Gonzalez on 11/11/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

typealias APICompletionHandler = (success: Bool, json: [[String : AnyObject]]) -> ()

class API {
    
    // MARK: WEB
    
    class func enqueue(apiRequest: APIRequest, completion: APICompletionHandler) {
        let request = NSMutableURLRequest.requestWithAPIRequest(apiRequest)
        self.session().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if error == nil {
                if let data = data {
                    do {
                        
                        //Requesting repositories that come back as an array of dictionaries.
                        if let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? [[String : AnyObject]] {
                            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                                completion(success: true, json: json)
                            })
                        }
                        
                        //Requesting current user information. Comes back as a dictionary.
                        if let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? [String : AnyObject] {
                            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                                completion(success: true, json: [json])
                            })
                        }
                    } catch _  { }
                }
            }
    }).resume()
}
    // MARK: Helper Functions
    
    class func configuration() -> NSURLSessionConfiguration {
        return NSURLSessionConfiguration.defaultSessionConfiguration()
    }
    
    class func session() -> NSURLSession {
        return NSURLSession(configuration: self.configuration())
    }
}
