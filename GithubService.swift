////
////  GithubService.swift
////  GoGoGithub
////
////  Created by Alberto Vega Gonzalez on 11/9/15.
////  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
////
//
//import Foundation
//
//class GithubService {
//    
//static let sharedService = GithubService()
//
//class func reposForSearchTerm(searchTerm: String, reposCallback : (String?, [Repository]?) -> (Void)){
//    
//    var results : [Repository]!
//    let baseURL = "https://api.github.com/search/repositories"
//    let finalURL = baseURL + "?q=\(searchTerm)"
//    
//    let request = NSMutableURLRequest(URL: NSURL(string: finalURL)!)
////    if let token = KeychainService.loadToken() {
////        request.setValue("token \(token)", forHTTPHeaderField: "Authorization")
////    }
//    
//    if let url = NSURL(string: finalURL){
//        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
//            if let error = error {
//                print("error")
//                reposCallback("Could not connect to server", nil)
//            } else if let httpResponse = response as? NSHTTPURLResponse {
//                print("repos response: \(httpResponse.statusCode)")
//                
//                switch httpResponse.statusCode {
//                case 200...299:
//                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
////                        let repos = GithubJSONParser.reposInfoFromJSONData(data)
////                        reposCallback(nil,repos)
//                    })
//                case 400...499:
//                    reposCallback("this is our fault",nil)
//                case 500...599:
//                    reposCallback("this is the servers fault", nil)
//                default:
//                    reposCallback("error occured",nil)
//                }
//            }
//        }).resume()
//    }
//}
//}