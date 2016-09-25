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
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "registerCompletion:", name: "registerCompletionNotification", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerCompletion(notification: NSNotification) {
        let theData: NSDictionary = notification.userInfo!
        let username = theData.objectForKey("username") as! NSString
        NSLog("username = %@", username)
    }


}

