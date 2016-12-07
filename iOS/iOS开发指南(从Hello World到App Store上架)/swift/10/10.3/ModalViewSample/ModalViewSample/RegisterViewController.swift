//
//  RegisterViewController.swift
//  ModalViewSample
//
//  Created by andyron on 25/09/2016.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var textUsername: UITextField!
    
    @IBAction func save(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) {
            () -> Void in
            NSLog("点击Save按钮，关闭模态视图")
            
            let dataDict = NSDictionary(object: self.textUsername.text!, forKey: "username")
            
            // 采用通知机制将参数回传给登录视图控制器
            // postNotificationName的三个参数分别对应 NSNotification 的三个属性:
            //name 通知的名字
            //object 投送通知时传递过来的对象
            //userInfo 投送通知时定义的字典对象
            NSNotificationCenter.defaultCenter().postNotificationName("RegisterCompletionNotification", object: nil, userInfo: dataDict as [NSObject : AnyObject])
        }

    }
    
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {
            NSLog("点击Cancel按钮，关闭模态视图")
        })
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
