//
//  ViewController.swift
//  Property List
//
//  Created by andyron on 16/8/31.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let myArray = [1, 2, 3]
        let array = myArray as NSArray
        let tempDirPath = NSTemporaryDirectory()
        let tempDirUrl = NSURL(fileURLWithPath: tempDirPath)
        let tempFileUrl = tempDirUrl.URLByAppendingPathComponent("tempFile.txt")
        array.writeToURL(tempFileUrl, atomically:true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

