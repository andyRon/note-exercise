//
//  AppDelegate.swift
//  BoundsCenter
//
//  Created by andyron on 2017/6/21.
//  Copyright © 2017年 andyron. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        self.window = UIWindow(frame: UIScreen.main.bounds)
        // iOS9后，可以简写
        self.window = UIWindow()
        self.window?.rootViewController = ViewController()
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        return true
    }
    
}

