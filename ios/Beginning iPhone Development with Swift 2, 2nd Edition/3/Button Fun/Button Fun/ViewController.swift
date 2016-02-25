//
//  ViewController.swift
//  Button Fun
//
//  Created by andyron on 16/2/25.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!

    @IBAction func buttonpressed(sender: UIButton) {
        let title = sender.titleForState(.Normal)!  // 当swift已经知道参数是枚举 UIControlState的一个值是可省略
        let text = "\(title) button pressed"
        statusLabel.text = text
        
        
    }


}

