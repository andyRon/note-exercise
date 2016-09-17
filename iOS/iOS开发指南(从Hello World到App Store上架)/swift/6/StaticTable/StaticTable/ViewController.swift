//
//  ViewController.swift
//  StaticTable
//
//  Created by andyron on 9/16/16.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    
    /*
    @IBAction func login(sender: AnyObject) {
        print(self.txtUserName.text!, self.txtPwd.text!)
        if self.txtUserName.text! == "andy" && self.txtPwd.text! == "123456" {
            NSLog("登录成功。")
            self.txtPwd.resignFirstResponder()
            self.txtUserName.resignFirstResponder()
        }
    }
 */
    
    @IBAction func login(sender: AnyObject) {
        print(self.txtUserName.text!, self.txtPwd.text!)
        if self.txtUserName.text! == "andy" && self.txtPwd.text! == "123456" {
            NSLog("登录成功。")
            self.txtPwd.resignFirstResponder()
            self.txtUserName.resignFirstResponder()
        }
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

