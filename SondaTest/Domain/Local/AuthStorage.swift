//
//  AuthStorage.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation

class AuthStorage: DefaultStorage {
    
    private static let sessionKey = "token_session"
    
    static var token: AuthToken? {
        get {
            return unarchiveObjectFor(key: sessionKey) as? AuthToken
        }
        set {
            archiveDataWith(object: newValue!, key: sessionKey)
        }
    }
    
    static func clearTokensSession() {
        clearDefaultsStorageForKey(key: sessionKey)
    }
    
}
