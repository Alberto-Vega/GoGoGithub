//
//  OAuthClient.swift
//  GoGoGithub
//
//  Created by Alberto Vega Gonzalez on 11/9/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

let kAccessTokenKey = "kAccessTokenKey"
let kOAuthBaseURLString = "https://github.com/login/oauth/"
let kAccessTokenRegexPattern = "access_token=([^&]+)"  //this is incomplete you can
//use different things to find a part of a string.
let kClientId = "405cf0ef46239dcd8971"
let kClientSecret = "b4418a2aab61ccf560cff2ab917e53eb9e19bed1"

typealias OAuthClientCompletion = (sucess: Bool) -> ()

enum OAuthClientError: ErrorType {
    case MissingAccessToken(String)
    case ExtractingTokenFromString()
    case ExtractingTemporaryCode(String)
    case ResponseFromGithub(String)
}

enum SaveOptions: Int {
    case UserDefaults
}

class OAuthClient {
    
    
        
        static let shared = OAuthClient()
    
    struct scope {
        var user = "user"
        var email = "email"
        var repo = "repo"
    }
    
    func requestGithubAccess() {
        let authURL = NSURL(string: "\(kOAuthBaseURLString)authorize?client_id=\(kClientId)&scope=scope,email,repo)")
    }
        
        func oauthRequestWithParameters(parameters: [String : String]) {
            var parameterString = String()
            for parameter in parameters.values {
                parameterString.stringByAppendingString(parameter)
            }
    
            // URL Constructor.
            func exchangeCodeInURL(codeURL : NSURL) {
                if let code = codeURL.query {
                    let request = NSMutableURLRequest(URL: NSURL(string: "https://github.com/login/oauth/access_token?\(code)&client_id=\(kClientId)&client_secret=\(kClientSecret)")!)
                    request.HTTPMethod = "POST"
                    request.setValue("application/json", forHTTPHeaderField: "Accept")
                    NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
                        if let httpResponse = response as? NSHTTPURLResponse {
                            var jsonError: NSError?
                            if let rootObject = NSJSONSerialization.JSONObjectWithData(data!, options: nil) as? [String : AnyObject], token = rootObject["access_token"] as? String {
                                //Save and handle the token
                            }
                        }
                    }).resume()
                }
            }

}
}
   