//
//  ViewController.swift
//  AlertViewActionSheet
//
//  Created by andyron on 16/8/21.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let screen = UIScreen.mainScreen().bounds
        // Alert
        let buttonAlertView = UIButton(type: UIButtonType.System)
        buttonAlertView.setTitle("Test警告框", forState: UIControlState.Normal)
        
        let buttonAlertViewWidth: CGFloat = 100
        let buttonAlertViewHeight: CGFloat = 30
        let buttonAlertViewTopView: CGFloat = 130
        
        buttonAlertView.frame = CGRectMake((screen.size.width - buttonAlertViewWidth)/2, buttonAlertViewTopView, buttonAlertViewWidth, buttonAlertViewHeight)
        buttonAlertView.addTarget(self, action: Selector("testAlertView:"), forControlEvents: .TouchUpInside)
        
//        buttonAlertView.contentEdgeInsets = UIEdgeInsets()
        buttonAlertView.layer.borderWidth = 1.0
        buttonAlertView.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        
        self.view.addSubview(buttonAlertView)
        
        // ActionSheet
        let buttonActionSheet = UIButton(type: UIButtonType.System)
        buttonActionSheet.setTitle("Test工作表", forState: UIControlState.Normal)
        
        let buttonActionSheetWidth: CGFloat = 100
        let buttonActionSheetHeight: CGFloat = 30
        let buttonActionSheetTopView: CGFloat = 260
        
        buttonActionSheet.frame = CGRectMake((screen.size.width - buttonActionSheetWidth)/2, buttonActionSheetTopView, buttonActionSheetWidth, buttonActionSheetHeight)
        buttonActionSheet.addTarget(self, action: Selector("testActionSheet:"), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(buttonActionSheet)
    }
    
    func testAlertView(sender: AnyObject) {
        let alertController: UIAlertController = UIAlertController(title: "Alert", message: "Alert text goes here", preferredStyle: UIAlertControllerStyle.Alert)
        
        let noAction = UIAlertAction(title: "No", style: .Cancel) {
            (alertAction) -> Void in
            NSLog("Tap No Button")
        }
        
        let yesAction = UIAlertAction(title: "Yes", style: .Default) {
            (alertAction) -> Void in
            NSLog("Tap Yes Button")
        }
        
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)

    }
    
    func testActionSheet(sender: AnyObject) {
        let actionSheetController: UIAlertController = UIAlertController()
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel) {
            (alertAction) -> Void in
            NSLog("Tap 取消 button")
        }
        
        let destructiveAction = UIAlertAction(title: "破坏性按钮", style: UIAlertActionStyle.Destructive) {
            (alertAction) -> Void in
            NSLog("Tap 破坏性按钮 button")
        }
        
        let otherAction = UIAlertAction(title: "新浪微博", style: UIAlertActionStyle.Default) {
            (alertAction) -> Void in
            NSLog("Tap 新浪微博 button")
        }
        
        actionSheetController.addAction(cancelAction)
        actionSheetController.addAction(destructiveAction)
        actionSheetController.addAction(otherAction)
        
        self.presentViewController(actionSheetController, animated: true, completion: nil)
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
