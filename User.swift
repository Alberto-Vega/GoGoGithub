//
//  User.swift
//  GoGoGithub
//
//  Created by Alberto Vega Gonzalez on 11/12/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation

class User {
    let name: String
    let login: String
    let location: String?
    let blog: String?
    let createdAt: NSDate
    let followers: Int
    
    init(name: String, login: String, location: String?, blog: String?, createdAt: NSDate, followers: Int) {
        self.name = name
        self.login = login
        self.location = location
        self.blog = blog
        self.createdAt = createdAt
        self.followers = followers
    }
}
