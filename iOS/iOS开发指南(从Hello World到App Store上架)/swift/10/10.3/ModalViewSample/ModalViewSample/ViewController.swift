//
//  ViewController.swift
//  ModalViewSample
//
//  Created by andyron on 24/09/2016.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 监听 RegisterViewController中自定义的通知 RegisterCompletionNotification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "registerCompletion:", name: "registerCompletionNotification", object: nil)
        
        // 监听系统通知 UIApplicationDidEnterBackgroundNotification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleEnterBackend", name: UIApplicationDidEnterBackgroundNotification, object: nil)
        // 监听系统通知 UIApplicationWillEnterForegroundNotification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleEnterForeground", name: UIApplicationWillEnterForegroundNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        // 注销通知代码
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func registerCompletion(notification: NSNotification) {
        let theData: NSDictionary = notification.userInfo!
        let username = theData.objectForKey("username") as! NSString
        NSLog("username = %@", username)
    }
    
    func handleEnterBackend() {
        NSLog("进入后台：UIApplicationDidEnterBackgroundNotification")
    }

    func handleEnterForeground() {
        NSLog("回到前台：UIApplicationWillEnterForegroundNotification")
    }
}

