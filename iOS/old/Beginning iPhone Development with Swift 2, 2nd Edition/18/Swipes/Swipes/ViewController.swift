//
//  ViewController.swift
//  Swipes
//
//  Created by andyron on 16/9/10.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    private var gestureStartPoint: CGPoint!
    private static let minimumGestureLength = Float(25.0)
    private static let maximumuVariance = Float(5)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            gestureStartPoint = touch.locationInView(self.view)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first, gestureStartPoint = self.gestureStartPoint {
            let currentPostion = touch.locationInView(self.view)
            
            let deltaX = fabsf(Float(gestureStartPoint.x - currentPostion.x))
            let deltaY = fabsf(Float(gestureStartPoint.y - currentPostion.y))
            
            if deltaX >= ViewController.minimumGestureLength && deltaY <= ViewController.maximumuVariance {
                label.text = "Horizontal swipe detected"
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1*NSEC_PER_SEC)), dispatch_get_main_queue()) {
                    self.label.text = ""
                }
            } else if deltaY >= ViewController.minimumGestureLength && deltaX <= ViewController.maximumuVariance {
                label.text = "Vertical swipe detected"
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1*NSEC_PER_SEC)), dispatch_get_main_queue()) {
                    self.label.text = ""
                }
            }
        }
    }

}

