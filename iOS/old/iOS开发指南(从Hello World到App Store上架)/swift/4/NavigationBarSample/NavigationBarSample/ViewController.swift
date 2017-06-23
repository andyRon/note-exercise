//
//  ViewController.swift
//  NavigationBarSample
//
//  Created by andyron on 16/8/23.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func save(sender: AnyObject) {
        self.label.text = "点击save"
    }
    
    @IBAction func add(sender: AnyObject) {
        self.label.text = "点击add"
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

