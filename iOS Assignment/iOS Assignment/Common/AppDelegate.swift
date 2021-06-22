//
//  AppDelegate.swift
//  iOS Assignment
//
//  Created by Shaik Shakir on 02/06/20.
//  Copyright © 2020 Shakir. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
        Router.createCustomTabbar()
        
        return true
    }
}

class Router: NSObject {
    static let tabBarController = UITabBarController()
    
    static func createCustomTabbar() {
        let homeTabNC: UINavigationController = UINavigationController.init(rootViewController: HomeVC())
        homeTabNC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), tag: 0)
        
        let exploreTabNC: UINavigationController = UINavigationController.init(rootViewController: ExploreVC())
        exploreTabNC.tabBarItem = UITabBarItem(title: "", image:  UIImage(named: "explore"), tag: 1)
        
        let addTabNC: UINavigationController = UINavigationController.init(rootViewController: AddVC())
        addTabNC.tabBarItem = UITabBarItem(title: "", image:  UIImage(named: "add"), tag: 2)
        
        let notificationTabNC: UINavigationController = UINavigationController.init(rootViewController: NotificationVC())
        notificationTabNC.tabBarItem = UITabBarItem(title: "", image:  UIImage(named: "notification"), tag: 3)
        
        let profileTabNC: UINavigationController = UINavigationController.init(rootViewController: ProfileVC())
        profileTabNC.tabBarItem = UITabBarItem(title: "", image:  UIImage(named: "profile"), tag: 4)
        
        tabBarController.selectedIndex = 0
        tabBarController.viewControllers = [homeTabNC, exploreTabNC, addTabNC, notificationTabNC, profileTabNC]
        
        UIApplication.shared.delegate?.window??.rootViewController = tabBarController
        UIApplication.shared.delegate?.window??.makeKeyAndVisible()
    }
}

