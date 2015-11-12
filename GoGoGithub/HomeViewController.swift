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

        
        GithubService.searchWithTerm("imageview") { (success, json) -> () in
            if success {
                
                print(json)
            }
    }
    
//        GithubCreateRepoService.init(name: "TEsting")
//        GithubCreateRepoService.httpBody()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
