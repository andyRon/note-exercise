//
//  ViewController.swift
//  Ball
//
//  Created by andyron on 9/14/16.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    fileprivate let updateInterval = 1.0/60.0
    fileprivate let motionManager = CMMotionManager()
    fileprivate let queue = OperationQueue()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /**
         swift 2 的语法
        motionManager.startDeviceMotionUpdatesToQueue(queue) {
            (motionData: CMDeviceMotion?, error: NSError?) -> Void in
            let ballView = self.view as! BallView
            ballView.acceleration = motionData!.gravity
            dispatch_async(dispatch_get_main_queue()) {
                ballView.update()
            }
        }
        */
        motionManager.startDeviceMotionUpdates(to: queue, withHandler: {
            motionData, error in
            let ballView = self.view as! BallView
            ballView.acceleration = motionData!.gravity
  
            DispatchQueue.main.async(execute: { 
                ballView.update()
            })
        })
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

