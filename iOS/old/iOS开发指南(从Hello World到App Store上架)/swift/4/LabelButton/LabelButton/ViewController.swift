//
//  ViewController.swift
//  LabelButton
//
//  Created by andyron on 16/8/9.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBAction func onClick(sender: AnyObject) {
        NSLog("OK Button onClick")
        self.label.text = "Hello, World"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

