//
//  ViewController.swift
//  UploadDownload
//
//  Created by andyron on 16/8/22.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activityIndicatorView: UIActivityIndicatorView!
    
    var progressView: UIProgressView!
    var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreen.mainScreen().bounds
        
        // 1. Activity Indicator View
        let ActivityIndicatorViewWidth: CGFloat = 40
        let ActivityIndicatorViewHeight: CGFloat = 40
        let ActivityIndicatorViewTopView: CGFloat = 50
        var frame = CGRectMake((screen.size.width - ActivityIndicatorViewWidth)/2, ActivityIndicatorViewTopView, ActivityIndicatorViewWidth, ActivityIndicatorViewHeight)
        
        self.activityIndicatorView = UIActivityIndicatorView(frame:frame)
        self.activityIndicatorView.activityIndicatorViewStyle = .WhiteLarge
        self.activityIndicatorView.color = UIColor.blueColor()
        self.activityIndicatorView.startAnimating()
        self.activityIndicatorView.hidesWhenStopped = true
        self.view.addSubview(self.activityIndicatorView)
        
        // 2. Upload Button
        let buttonUpload = UIButton(type: UIButtonType.System)
        let buttonUploadWidth: CGFloat = 50
        let buttonUploadHeight: CGFloat = 20
        buttonUpload.frame = CGRectMake((screen.size.width - buttonUploadWidth)/2, 100, buttonUploadWidth, buttonUploadHeight)
        buttonUpload.setTitle("Upload", forState: UIControlState.Normal)
        
        buttonUpload.addTarget(self, action: Selector("startMove:"), forControlEvents: .TouchUpInside)
        self.view.addSubview(buttonUpload)
        
        //3. Download Button
        let buttonDownload = UIButton(type: UIButtonType.System)
        let buttonDownloadWidth: CGFloat = 70
        let buttonDownloadHeight: CGFloat = 20
        buttonDownload.frame = CGRectMake((screen.size.width - buttonDownloadWidth)/2, 300, buttonDownloadWidth, buttonDownloadHeight)
        buttonDownload.setTitle("Download", forState: UIControlState.Normal)
        
        buttonDownload.addTarget(self, action: Selector("downloadProgress:"), forControlEvents: .TouchUpInside)
        self.view.addSubview(buttonDownload)
        
        // 4. progressView
        let progressViewWidth: CGFloat = 280
        let progressViewHeight: CGFloat = 2
        let progressViewTopView: CGFloat = 230
        frame = CGRectMake((screen.size.width - progressViewWidth)/2, progressViewTopView, progressViewWidth, progressViewHeight)
        self.progressView = UIProgressView(frame: frame)
        
        self.view.addSubview(self.progressView)
        
    }
    
    
    func startMove(sender: AnyObject) {
        if (self.activityIndicatorView.isAnimating()) {
            self.activityIndicatorView.stopAnimating()
        } else {
            self.activityIndicatorView.startAnimating()
        }
    }
    
    func downloadProgress(sender: AnyObject) {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("download"), userInfo: nil, repeats: true)
    }
    
    func download() {
        self.progressView.progress = self.progressView.progress + 0.1
        if (self.progressView.progress == 1.0) {
            self.timer.invalidate()
            
            let alertController: UIAlertController = UIAlertController(title: "download completed!", message: "", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(okAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
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
