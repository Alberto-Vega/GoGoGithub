//
//  HomeViewController.swift
//  GoGoGithub
//
//  Created by Alberto Vega Gonzalez on 11/11/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var createRepoTest = GithubCreateRepoService(name: "TestRepo")

    
    class func identifier() -> String {
        return "HomeViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.createNewRepo()
    }
    
    func createNewRepo() {
        guard let token =  OAuthClient.shared.token else {return}
        guard let url = NSURL(string: "https://api.github.com/user/repos?access_token=\(token)") else { return }
        
        print(url)
        
        let parameters = ["name" : "HereIsNew"]
        let body = try! NSJSONSerialization.dataWithJSONObject(parameters, options: .PrettyPrinted)
        
        let aRequest = NSMutableURLRequest(URL: url)
        aRequest.setValue("application/json", forHTTPHeaderField:"Accept")
        aRequest.HTTPBody = body
        aRequest.HTTPMethod = "POST"
        
        NSURLSession.sharedSession().dataTaskWithRequest(aRequest, completionHandler: { (data, response, error) -> Void in
            
            if let error = error {
                print(error)
            }
            
            print(response)
            
            if let data = data {
                let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
                print(json)
            }
            
        }).resume()
    }

}
