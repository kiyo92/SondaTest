//
//  DefaultStorage.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation

class DefaultStorage {
    
    static let userDefaults = UserDefaults.standard
    
    static func archiveDataWith(object : AnyObject, key: String) {
        do {
            let encodedObject = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            userDefaults.set(encodedObject, forKey: key)
            userDefaults.synchronize()
        } catch let signOutError as NSError {
            print ("Error archiving data", signOutError)
        }
    }
    
    static func unarchiveObjectFor(key : String) -> AnyObject? {
        if let objectData = userDefaults.object(forKey: key) as? NSData {
            return NSKeyedUnarchiver.unarchiveObject(with: objectData as Data) as AnyObject?
        }
        
        return nil
    }
    
    static func saveBoolToDefaults(key: String, value: Bool) {
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }
    
    static func getBoolFromDefaults(key: String) -> Bool {
        let value = userDefaults.bool(forKey: key)
        return value
    }
    
    static func clearDefaultsStorageForKey(key: String) {
        userDefaults.set(nil, forKey: key)
    }
    
    static func add(key: String, value: AnyObject){
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }
    
    static func get(key: String) -> String{
        if let value = userDefaults.object(forKey: key) as? String {
            return value
        }
        return ""
    }
    
}
