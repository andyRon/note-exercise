//
//  ViewController.swift
//  Orientations
//
//  Created by andyron on 16/2/29.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        print(UIInterfaceOrientationMask.Portrait.rawValue)
        print(UIInterfaceOrientationMask.Landscape.rawValue)
        return UIInterfaceOrientationMask(rawValue: (UIInterfaceOrientationMask.Portrait.rawValue | UIInterfaceOrientationMask.Landscape.rawValue))
//        UIInterfaceOrientationMaskPortrait
    }

}

