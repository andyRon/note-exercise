//
//  ViewController.swift
//  AlamofireTest
//
//  Created by andyron on 2017/1/18.
//  Copyright © 2017年 andyron. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://api.500px.com/v1/photos", method: .get).responseJSON {
            response in
            guard let JSON = response.result.value else { return }
            
            print("JSON: \(JSON)")
            NSLog("\(JSON)")
        }
        
    }



}

