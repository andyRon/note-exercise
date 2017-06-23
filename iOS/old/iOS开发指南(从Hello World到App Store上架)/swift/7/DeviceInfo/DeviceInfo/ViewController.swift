//
//  ViewController.swift
//  DeviceInfo
//
//  Created by andyron on 9/21/16.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let iOSDeviceScreenSize: CGSize = UIScreen.mainScreen().bounds.size
        NSLog("%@ x %@", iOSDeviceScreenSize.width, iOSDeviceScreenSize.height)
        var s: NSString = NSString(format: "%@ x %@", iOSDeviceScreenSize.width, iOSDeviceScreenSize.height)
//        self.label.text = s
        
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            if iOSDeviceScreenSize.height > iOSDeviceScreenSize.width {
                // 竖屏
                if iOSDeviceScreenSize.height == 568 {
                    NSLog("iPhone 5/5s/5c (iPod touch 5) 设备")
                } else if iOSDeviceScreenSize.height == 667 {
                    NSLog("iPhone 6/6s 设备")
                } else if iOSDeviceScreenSize.height == 736 {
                    NSLog("iPhone 6/6s plus 设备")
                } else {
                    NSLog("iPhone 4s... 设备" )
                }
            }
            
            if iOSDeviceScreenSize.width > iOSDeviceScreenSize.height {
                if iOSDeviceScreenSize.width == 568 {
                    NSLog("iPhone 5/5s/5c (iPod touch 5) 设备")
                } else if iOSDeviceScreenSize.width == 667 {
                    NSLog("iPhone 6/6s 设备")
                } else if iOSDeviceScreenSize.width == 736 {
                    NSLog("iPhone 6/6s plus 设备")
                } else {
                    NSLog("iPhone 4s... 设备")
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

