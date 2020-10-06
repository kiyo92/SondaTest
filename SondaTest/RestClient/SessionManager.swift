//
//  SessionManager.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation
import Alamofire

class SessionManager {
    private static var SCHEME: String = "https://"
    
    private static var HOST: String = "jsonplaceholder.typicode.com"
    private static var PATH: String = "\(SCHEME)\(HOST)"
    
    
    //Auth
    static var USERS: String = "\(PATH)/users"
    
    //Feed
    static var PHOTOS: String = "\(PATH)/photos"
    
    struct APIManager {
        static let sessionManager: Alamofire.SessionManager = {
            let configuration = URLSessionConfiguration.default
            var headers = Alamofire.SessionManager.defaultHTTPHeaders
            headers["Content-Type"] = "application/json"
            headers["Accept"] = "application/json"
            //Caso existisse
            //headers["Authorization"] = "Token \(AuthStorage.token?.token ?? "" )"
            
            configuration.httpAdditionalHeaders = headers
            return Alamofire.SessionManager(
                configuration: configuration
            )
        }()
        
    }
    
    public static func getSession()-> Alamofire.SessionManager {
        return APIManager.sessionManager
    }
}
