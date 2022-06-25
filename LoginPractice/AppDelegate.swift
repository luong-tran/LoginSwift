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
        
        let loginScreen = LoginViewController()
        window?.rootViewController = UINavigationController(rootViewController: loginScreen)
        
        return true
    }



}

