//
//  RootViewController.swift
//  code
//
//  Created by andyron on 16/8/9.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let screen = UIScreen.mainScreen().bounds
        let labelWidth:CGFloat = 108
        let labelHeight:CGFloat = 20
        let labelTopView:CGFloat = 200
        let label = UILabel(frame: CGRectMake((screen.size.width - labelWidth)/2, labelTopView, labelWidth, labelHeight))
        label.text = "Hello, Code"
        label.textAlignment = .Center
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
