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
        let title = sender.titleForState(.Normal)!
        let text = "\(title) button pressed"
        statusLabel.text = text
    }


}

