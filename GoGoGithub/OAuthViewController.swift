//
//  ViewController.swift
//  GoGoGithub
//
//  Created by Alberto Vega Gonzalez on 11/9/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class OAuthViewController: UIViewController {
    
    class func identifier() -> String {
        return "OAuthViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GithubService.searchWithTerm("imageview") { (success, json) -> () in
            if success {
                
                print(json)
                
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonSelected(sender: UIButton) {
        if OAuthClient.shared.token == nil {
            OAuthClient.shared.requestGithubAccess()
        } else {
            print("Retrieved token from user defaults")
        }
    }
}

