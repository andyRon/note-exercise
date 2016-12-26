//
//  ViewController.swift
//  test
//
//  Created by andyron on 2016/12/23.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let documentDiretory: [String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        // "/var/mobile/Containers/Data/Application/26E73620-C7F3-4820-BC2C-29DD16D6BA05/Documents"
        print(documentDiretory, FileManager.SearchPathDirectory.userDirectory)
        
        let tmpDiretory = NSTemporaryDirectory()
        print(tmpDiretory)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

