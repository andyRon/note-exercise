//
//  ViewController.swift
//  ToolbarSample-Code
//
//  Created by andyron on 16/8/22.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screen = UIScreen.mainScreen().bounds
        
        let toolbarHeight: CGFloat = 44
        
        // toolbar
        let toolbar = UIToolbar(frame: CGRectMake(0, screen.size.height - toolbarHeight, screen.size.height, screen.size.height))
        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: Selector("save:"))
        
        let openButtonItem = UIBarButtonItem(title: "Open", style: .Plain, target: self, action: Selector("open:"))
        
        let flexibleButtonItem = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        
        toolbar.items = [saveButtonItem, flexibleButtonItem, openButtonItem]
        self.view.addSubview(toolbar)
        
        // label
        let labelWidth: CGFloat = 84
        let labelHeight: CGFloat = 21
        let labelTopView: CGFloat = 250
        self.label = UILabel(frame: CGRectMake((screen.size.width - labelWidth)/2, labelTopView, labelWidth, labelHeight))
        
        self.label.textAlignment = .Center
        
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func save(sender: AnyObject) {
        self.label.text = "保存"
    }
    
    func open(sender: AnyObject) {
        self.label.text = "打开"
    }


}

