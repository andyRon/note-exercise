//
//  ViewController.swift
//  ToolbarSample
//
//  Created by andyron on 16/8/22.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func save(sender: AnyObject) {
        self.label.text = "保存"
    }

    @IBAction func open(sender: AnyObject) {
        self.label.text = "打开"
    }
}

