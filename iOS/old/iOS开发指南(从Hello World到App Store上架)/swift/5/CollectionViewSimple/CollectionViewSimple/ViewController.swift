//
//  ViewController.swift
//  CollectionViewSimple
//
//  Created by andyron on 16/8/24.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var events: NSArray!
    
    var COL_NUM = 2 //每一行的单元格数
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bundle = NSBundle.mainBundle()
        let plistPath = bundle.pathForResource("events", ofType: "plist")
        self.events = NSArray(contentsOfFile: plistPath!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -- UICollectionViewDataSource
    // 总共多少节（行）
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        let num = self.events.count % COL_NUM
        if (num == 0) {
            return self.events.count / COL_NUM
        } else {
            return self.events.count / COL_NUM + 1
        }
    }
    // 一节（一行）的列数
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return COL_NUM
    }
    // 为某一个单元格提供显示数据
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellIdentifier", forIndexPath: indexPath) as! EventCollectionView
        
        let event = self.events[indexPath.section * COL_NUM + indexPath.row] as! NSDictionary
        
        cell.label.text = event["name"] as? String
        cell.imageView.image = UIImage(named: event["image"] as! String)
        
        return cell
    }
    
    //MARK: -- UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let event = self.events[indexPath.section * COL_NUM + indexPath.row] as! NSDictionary
        NSLog("select event name: %@", event["name"] as! String)
    }

}

