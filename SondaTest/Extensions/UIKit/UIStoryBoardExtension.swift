//
//  UIStoryBoardExtension.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    // MARK: AUTH storyboard
    static func buildLoginViewController() -> UIViewController {
        return loginStoryboard.instantiateViewController(withIdentifier: "login")
    }
    
    // MARK: MAIN storyboard
    static func buildMainViewController() -> UIViewController {
        return mainStoryboard.instantiateViewController(withIdentifier: "main")
    }
    
    // MARK: FEED storyboard
    static func buildFeedViewController() -> UIViewController {
        return feedStoryboard.instantiateViewController(withIdentifier: "feed")
    }
    
    // MARK: CAMERA storyboard
    static func buildCameraViewController() -> UIViewController {
        return cameraStoryboard.instantiateViewController(withIdentifier: "camera")
    }
    // MARK: SETTINGS storyboard
    static func buildSettingsViewController() -> UIViewController {
        return settingsStoryboard.instantiateViewController(withIdentifier: "settings")
    }
    

    
}

extension UIStoryboard {
    
    static var loginStoryboard : UIStoryboard {
        return getStoryboard(name: "Login")
    }
    
    static var mainStoryboard : UIStoryboard {
        return getStoryboard(name: "Main")
    }
    static var feedStoryboard : UIStoryboard {
        return getStoryboard(name: "Feed")
    }
    static var cameraStoryboard : UIStoryboard {
        return getStoryboard(name: "Camera")
    }
    static var settingsStoryboard : UIStoryboard {
        return getStoryboard(name: "Settings")
    }
}
extension UIStoryboard {
    
    static func getStoryboard(name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }
}
