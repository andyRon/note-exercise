//
//  ViewController.swift
//  UploadDownload
//
//  Created by andyron on 16/8/21.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var progressView: UIProgressView!
    var timer: NSTimer!
    
    @IBAction func startMove(sender: AnyObject) {
        if (self.activityIndicatorView.isAnimating()) {
            self.activityIndicatorView.stopAnimating()
        } else {
            self.activityIndicatorView.startAnimating()
        }
    }
    
    @IBAction func downloadProgress(sender: AnyObject) {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

