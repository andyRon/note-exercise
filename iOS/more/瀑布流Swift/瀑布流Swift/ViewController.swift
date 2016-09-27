//
//  ViewController.swift
//  瀑布流Swift
//
//  Created by andyron on 27/09/2016.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var shops = [NSMutableArray]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        var shopsArray = shopModel()
    }

//    func shops() -> NSMutableArray {
//        if self.shops == nil {
//            self.shops = [NSMutableArray]()
//        }
//        return self.shops
//    }
}

