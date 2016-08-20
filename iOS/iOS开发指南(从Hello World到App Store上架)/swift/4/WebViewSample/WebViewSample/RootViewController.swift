//
//  RootViewController.swift
//  WebViewSample
//
//  Created by andyron on 16/8/20.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit
import WebKit

class RootViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let screen = UIScreen.mainScreen().bounds
        
        // 按钮
        let bottonBarWidth: CGFloat = 316
        let frame = CGRectMake((screen.size.width - bottonBarWidth)/2, 20, bottonBarWidth, 30)
        let buttonBar = UIView(frame: frame)
        self.view.addSubview(buttonBar)
        
        //1. LoadHTMLString
        let buttonLoadHTMLString = UIButton(type: UIButtonType.System)
        buttonLoadHTMLString.setTitle("LoadHTMLString", forState: UIControlState.Normal)
        buttonLoadHTMLString.frame = CGRectMake(0, 0, 117, 30)
        
        buttonLoadHTMLString.addTarget(self, action: Selector("testLoadHTMLString:"), forControlEvents: .TouchUpInside)
        buttonBar.addSubview(buttonLoadHTMLString)
        
        //2. LoadData
        let buttonLoadData = UIButton(type: UIButtonType.System)
        buttonLoadData.setTitle("LoadData", forState: UIControlState.Normal)
        buttonLoadData.frame = CGRectMake(137, 0, 67, 30)
        
        buttonLoadData.addTarget(self, action: Selector("testLoadData:"), forControlEvents: .TouchUpInside)
        buttonBar.addSubview(buttonLoadData)
        
        //3. LoadRequest
        let buttonLoadRequest = UIButton(type: UIButtonType.System)
        buttonLoadRequest.setTitle("LoadRequest", forState: UIControlState.Normal)
        buttonLoadRequest.frame = CGRectMake(224, 0, 92, 30)
        
        buttonLoadRequest.addTarget(self, action: Selector("testLoadRequest:"), forControlEvents: .TouchUpInside)
        buttonBar.addSubview(buttonLoadRequest)
        
        //4. WKWebView
        self.webView = WKWebView(frame: CGRectMake(0, 60, screen.size.width, screen.size.height - 80))
        self.view.addSubview(self.webView)
        
    }
    
    func testLoadHTMLString(sender: AnyObject) {
        
        let htmlPath = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        let bundleUrl = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
        
        do {
            let html = try NSString(contentsOfFile: htmlPath!, encoding: NSUTF8StringEncoding)
            self.webView.loadHTMLString(html as String, baseURL: bundleUrl)
            
        } catch let err as NSError {
            err.description
        }
        
        
    }
    
    func testLoadData(sender: AnyObject) {
        
        let htmlPath = NSBundle.mainBundle().pathForResource("index2", ofType: "html")
        let bundleUrl = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
        
        let htmlData = NSData(contentsOfFile: htmlPath!)
        
        self.webView.loadData(htmlData!, MIMEType: "text/html", characterEncodingName: "UTF-8", baseURL: bundleUrl)
    }
    
    func testLoadRequest(sender: AnyObject) {
        
        let url = NSURL(string: "http://weibo.com/andyronm")
        let request = NSURLRequest(URL: url!)
        self.webView.loadRequest(request)
        self.webView.navigationDelegate = self
        
    }
    //MARK: -- WKNavigationDelegate
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        NSLog("开始加载")
    }
    
    func webView(webView: WKWebView, didCommitNavigation navigation: WKNavigation!) {
        NSLog("内容开始返回")
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        NSLog("加载完成")
    }
    
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        NSLog("加载失败 erro: %@", error.description)
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
