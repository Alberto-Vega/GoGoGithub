//
//  AppDelegate.swift
//  GoGoGithub
//
//  Created by Alberto Vega Gonzalez on 11/9/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var oauthViewController: OAuthViewController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.checkOAuthStatus()
        return true
    }
    
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        
        OAuthClient.shared.exchangeCodeInURL(url) { (success) -> () in
            if success {
                guard let oauthViewController = self.oauthViewController else {return}
                oauthViewController.processLogin()
            }
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func checkOAuthStatus() {
        if let _ = OAuthClient.shared.token  {
            print("We have a token at did finishLaunching with options")
        } else {
            print("We do not have a token at did finishLaunching with options")
            self.presentOAuthViewController()
        }
    }
    
    func presentOAuthViewController() {
        if let homeViewController = self.window?.rootViewController as? HomeViewController, storyboard = homeViewController.storyboard {
            if let oAuthViewController = storyboard.instantiateViewControllerWithIdentifier(OAuthViewController.identifier()) as? OAuthViewController {
                homeViewController.addChildViewController(oAuthViewController)
                homeViewController.view.addSubview(oAuthViewController.view)
                oAuthViewController.didMoveToParentViewController(homeViewController)
                oAuthViewController.oAuthCompletionHandler = ({
                    UIView.animateWithDuration(0.8, delay: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                        oAuthViewController.view.alpha = 0.0
                        }, completion: { (finished) -> Void in
                            oAuthViewController.view.removeFromSuperview()
                            oAuthViewController.removeFromParentViewController()
                            /////////////////////////////////
                            //HERE make the call for updates
//                            homeViewController.update()
                    })
                })
            
                self.oauthViewController = oAuthViewController
            }

    }
}
}

