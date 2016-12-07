//
//  AppDelegate.swift
//  KVO
//
//  Created by andyron on 2016/12/7.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    dynamic var appStatus:NSString!  // dynamic表示该属性是运行是动态派发的
    var observer:AppStatusObserver!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.observer = AppStatusObserver()
        /**
         定义观察者（self.observer, AppStatusObserver）开始观察属性appStatus的变化
         options是属性变化设置的选项
         */
        self.addObserver(self.observer, forKeyPath: "appStatus", options: [NSKeyValueObservingOptions.new, NSKeyValueObservingOptions.old], context: nil)
        self.appStatus = "launch"
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        self.appStatus = "inactive"
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        self.appStatus = "background"
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        self.appStatus = "foreground"
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        self.appStatus = "active"
    }

    func applicationWillTerminate(_ application: UIApplication) {
        self.appStatus = "terminate"
    }


}

