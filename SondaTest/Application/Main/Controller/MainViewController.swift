//
//  MainViewController.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var tabItems: [NavigationItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.tabBarController?.delegate = self
        
        tabItems.append(NavigationItem("menu_icon_home", "Feed de imagens"))
        tabItems.append(NavigationItem("menu_icon_vehicles", "Tirar foto"))
        tabItems.append(NavigationItem("menu_icon_license", "Mais..."))
        
        
        self.viewControllers = [
            UIStoryboard.buildFeedViewController(),
            UIViewController(),
            UIStoryboard.buildSettingsViewController(),
        ]
        customizeTabBar()
        tabBar.barTintColor = UIColor.white
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
         let tabBarIndex = tabBarController.selectedIndex
         if tabBarIndex == 1 {
             let vc = UIImagePickerController()
             vc.sourceType = .camera
             vc.allowsEditing = true
             vc.delegate = self
             present(vc, animated: true)
         }
    }
}

extension MainViewController {
    
    private func customizeTabBar() {
        
        if let count = self.tabBar.items?.count {
            for i in 0...(count-1) {
                let imageNameForUnselectedState = tabItems[i].icon
                self.tabBar.items?[i].image = UIImage(named: imageNameForUnselectedState)
                self.tabBar.items?[i].title = tabItems[i].title
                if let font = UIFont(name: "Rubik-Regular", size: 12.0) {
                    self.tabBar.items?[i].setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
                    self.tabBar.items?[i].setTitleTextAttributes([NSAttributedString.Key.font: font], for: .selected)
                }
            }
        }
        
        self.tabBar.tintColor = UIColor.blue
        self.tabBar.backgroundColor = UIColor.white
    }
}

extension MainViewController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
}

class NavigationItem {
    var icon: String
    var title: String
    
    init(_ icon: String, _ title: String) {
        self.icon = icon
        self.title = title
    }
}
