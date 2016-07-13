//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by andyron on 16/7/13.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // http://swift.gg/2015/12/22/alamofire-beginner-guide/
        Alamofire.request(.GET, "https://rocky-meadow-1164.herokuapp.com/todo") .responseJSON { response in // 1
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

