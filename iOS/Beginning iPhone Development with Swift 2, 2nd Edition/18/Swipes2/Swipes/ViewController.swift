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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let vertical = UISwipeGestureRecognizer(target: self, action: "reportVerticalSwipe:")
        vertical.direction = [.Up, .Down]
        view.addGestureRecognizer(vertical)
        
        let horizontal = UISwipeGestureRecognizer(target: self, action: "reportHorizontalSwipe:")
        horizontal.direction = [.Left, .Right]
        view.addGestureRecognizer(horizontal)
    }
    
    func reportHorizontalSwipe(recognizer: UIGestureRecognizer) {
        label.text = "Horizontal swipe detected"
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * NSEC_PER_SEC)), dispatch_get_main_queue()){
            self.label.text = ""
        }
    }
    
    func reportVerticalSwipe(recognizer: UIGestureRecognizer) {
        label.text = "Vertical swipe detected"
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * NSEC_PER_SEC)), dispatch_get_main_queue()){
            self.label.text = ""
        }
    }
}

