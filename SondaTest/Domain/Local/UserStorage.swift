//
//  UserStorage.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation
class UserStorage: DefaultStorage {
    
    private static let sessionKey = "user_session"
    
    static var user: User? {
        get {
            return unarchiveObjectFor(key: sessionKey) as? User
        }
        set {
            archiveDataWith(object: newValue!, key: sessionKey)
        }
    }
    
    static func clearUserSession() {
        clearDefaultsStorageForKey(key: sessionKey)
    }
    
}
