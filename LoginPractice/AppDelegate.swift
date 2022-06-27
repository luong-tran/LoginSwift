//
//  AppDelegate.swift
//  LoginPractice
//
//  Created by LuongTran on 25/06/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let userDefaults = UserDefaults.standard
        let loginScreen = LoginViewController()
        
        if let username = userDefaults.string(forKey: "username"){
            let homeViewController = HomeViewController()
            homeViewController.tokenUser = username
            
            let navigationController = UINavigationController()
            navigationController.viewControllers = [loginScreen, homeViewController]
            window?.rootViewController = navigationController
        }else{
            let navigationController = UINavigationController(rootViewController: loginScreen)
            window?.rootViewController = navigationController
        }
//        window?.rootViewController = UINavigationController(rootViewController: loginScreen)
        
        return true
    }



}

