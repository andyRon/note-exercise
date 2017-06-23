//
//  ViewController.swift
//  NavigationBarSample2-Code
//
//  Created by andyron on 16/8/23.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label: UILabel!
    
    func add(sender: AnyObject) {
        self.label.text = "点击Add"
    }
    
    func save(sender: AnyObject) {
        self.label.text = "点击Save"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screen = UIScreen.mainScreen().bounds
        
        // label
        let labelWidth: CGFloat = 80
        let labelHeight: CGFloat = 40
        let labelTopView: CGFloat = 250
        self.label = UILabel(frame: CGRectMake((screen.size.width - labelWidth)/2, labelTopView, labelWidth, labelHeight))
        self.label.text = "label"
        self.label.textAlignment = .Center
        
        self.view.addSubview(self.label)
        
        
        // nav
        let navigationBarHeight: CGFloat = 44
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 20, screen.size.width, navigationBarHeight))
        
        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: Selector("save:"))
        
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: Selector("add:"))
        
        
        let navigationItem = UINavigationItem(title: "Home")
        navigationItem.leftBarButtonItem = saveButtonItem
        navigationItem.rightBarButtonItem = addButtonItem
        
        navigationBar.items = [navigationItem]
        self.view.addSubview(navigationBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

