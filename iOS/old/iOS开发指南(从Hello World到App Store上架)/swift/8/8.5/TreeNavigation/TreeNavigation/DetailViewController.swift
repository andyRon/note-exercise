//
//  DetailViewController.swift
//  TreeNavigation
//
//  Created by andyron on 2016/10/25.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    var url: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 添加WKWebView
        self.webView = WKWebView(frame: self.view.frame)
        self.view.addSubview(self.webView)
        self.webView.navigationDelegate = self
        
        let  url = NSURL(string: self.url)
        let requet = NSURLRequest(URL: url!)
        self.webView.loadRequest(requet)
    }

    

}
