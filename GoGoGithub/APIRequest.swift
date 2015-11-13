//
//  APIRequest.swift
//  GoGoGithub
//
//  Created by Alberto Vega Gonzalez on 11/11/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

let kEmptyString = ""

enum MIMEType: String {
    case ApplicationXWWWFormUrlEncoded = "application/x-www-from-urlencoded"
    case ApplicationJSON = "application/json"
}

enum HTTPMethod: String {
    case POST = "POST"
    case GET = "GET"
    case DELETE = "DELETE"
    case PUT = "PUT"
}

class APIRequest {
    
    var httpMethod = HTTPMethod.GET
    var headerContentType = MIMEType.ApplicationJSON
    
    func url() -> String { return kEmptyString }
    func httpHeaders() -> [String : String]? { return nil }
    func httpBody() -> NSData? { return nil }
    func queryStringParameters() -> [String : String]? { return nil }
}


