//
//  User.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserKey {
    
    static let emailKey = "email_key"
    static let passwordKey = "password_key"
}

class User: ErrorHandler, NSCoding, Mappable {
    
    var email: String = ""
    var password: String = ""
    
    override init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init()
        self.decoding(aDecoder: aDecoder)
    }
    
    func mapping(map: Map) {
        email                <- map["email"]
        password             <- map["password"]
    }
    
    // MARK: - Decoding / Encoding
    func decoding(aDecoder : NSCoder) {

        let sEmail: String = (aDecoder.decodeObject(forKey: UserKey.emailKey) as? String)!
        
        self.email = sEmail
    }
    
    func encode(with aCoder: NSCoder) {

        aCoder.encode(self.email, forKey: UserKey.emailKey)
    }
}

extension User {
    
    public static func getUserFrom(responseJSON: Data) -> User {
        var object: User = User()
        do {
            if let jsonData = try JSONSerialization.jsonObject(with: responseJSON, options: JSONSerialization.ReadingOptions()) as? NSObject {
                let user = Mapper<User>().map(JSONObject: jsonData)
                object = user!
            }
        } catch _ {
        }
        return object
    }
    
    public static func getJsonFrom(user: User) -> NSDictionary {
        return Mapper<User>().toJSON(user) as NSDictionary
    }
}
