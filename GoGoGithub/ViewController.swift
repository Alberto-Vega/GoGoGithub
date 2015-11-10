//
//  ViewController.swift
//  GoGoGithub
//
//  Created by Alberto Vega Gonzalez on 11/9/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSUserDefaults.standardUserDefaults().stringForKey("PersistedAccessToken")
        GithubService.searchWithTerm("") { (success, json) -> () in
            if success {
                print("hurray")
                
            } else {
                print("error with search term open source")
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonSelected(sender: UIButton) {
        OAuthClient.shared.requestGithubAccess()
        
    }
    
}

