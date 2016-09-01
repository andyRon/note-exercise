//
//  ViewController.swift
//  Persistence
//
//  Created by andyron on 16/8/31.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private static let  rootKey = "rootKey"
    @IBOutlet var lineFields:[UITextField]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fileURL = self.dataFileURL()
        if (NSFileManager.defaultManager().fileExistsAtPath(fileURL.path!)) {
            if let array = NSArray(contentsOfURL: fileURL) as? [String] {
                for var i=0; i < array.count; i += 1 {
                    lineFields[i].text = array[i]
                }
            }
        }
        
        let app = UIApplication.sharedApplication()
        // 当应用退到后台时，执行applicationWillResignActive:
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillResignActive:", name: UIApplicationWillResignActiveNotification, object: app)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dataFileURL() -> NSURL {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        
//        return urls.first!.URLByAppendingPathComponent("data.plist")
        return urls.first!.URLByAppendingPathComponent("data.archive")
        
    }
    
    func applicationWillResignActive(notification: NSNotification) {
        let fileURL = self.dataFileURL()
        
        let fourLines = FourLines()
        let array = (self.lineFields as NSArray).valueForKey("text")
            as! [String]
        fourLines.lines = array
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(fourLines, forKey: ViewController.rootKey)
        archiver.finishEncoding();
        data.writeToURL(fileURL, atomically: true)
    }

}

