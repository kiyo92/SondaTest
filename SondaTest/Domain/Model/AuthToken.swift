//
//  AuthToken.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation
import ObjectMapper

struct TokenKey {
    static let tokenKey = "token_key"
}

class AuthToken: ErrorHandler, NSCoding, Mappable {
    
    var token: String = ""
    
    override init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init()
        self.decoding(aDecoder: aDecoder)
    }
    
    func mapping(map: Map) {
        token <- map["token"]
    }
    
    // MARK: - Decoding / Encoding
    func decoding(aDecoder : NSCoder) {
        let sToken: String = (aDecoder.decodeObject(forKey: TokenKey.tokenKey) as? String)!
        
        self.token = sToken
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.token, forKey: TokenKey.tokenKey)
    }
}

extension AuthToken {
    
    public static func getTokenFrom(responseJSON: Data) -> AuthToken {
        var object: AuthToken = AuthToken()
        do {
            if let jsonData = try JSONSerialization.jsonObject(with: responseJSON, options: JSONSerialization.ReadingOptions()) as? NSObject {
                let token = Mapper<AuthToken>().map(JSONObject: jsonData)
                object = token!
            }
        } catch _ {
        }
        return object
    }
}
