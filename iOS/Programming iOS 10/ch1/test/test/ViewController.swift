//
//  ViewController.swift
//  test
//
//  Created by andyron on 2017/2/17.
//  Copyright © 2017年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let v = UIView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        v.backgroundColor = .red
        self.view.addSubview(v)
        
//        self.view.window
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

