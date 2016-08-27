//
//  ViewController.swift
//  CollectionViewSimple
//
//  Created by andyron on 16/8/27.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var COL_NUM = 2
    var events: NSArray!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let bundle = NSBundle.mainBundle()
        
        let plistPath = bundle.pathForResource("events", ofType: "plist")
        self.events = NSArray(contentsOfFile: plistPath!)
        
        
        self.setupCollectionView()
    }
    
    func setupCollectionView() {
        // 1.创建流式布局
        let layout = UICollectionViewFlowLayout()
        // 2.设置每一个单元格的尺寸
        layout.itemSize = CGSizeMake(150, 150)
        // 3.设置整个collectionView的内边距
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        // 4.设置每一行之间的边距
        layout.minimumLineSpacing = 10
        // 5.设置单元格之间的间距
        layout.minimumInteritemSpacing = 10
        
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        // 设置可重用单元格标识与单元格类型
        self.collectionView.registerClass(EventCollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        
        self.collectionView.backgroundColor = UIColor.whiteColor()
        
        self.collectionView.dataSource = self
        self.collectionView.dataSource = self
        
        self.view.addSubview(self.collectionView)
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
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellIdentifier", forIndexPath: indexPath) as! EventCollectionViewCell
        
        let event = self.events[indexPath.section * COL_NUM + indexPath.row] as! NSDictionary
        
        cell.label.text = event["name"] as? String
        cell.imageView.image = UIImage(named: event["image"] as! String)
        
        return cell
    }
    
    //MARK: -- UICollectionViewDelegate     ???
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let event = self.events[indexPath.section * COL_NUM + indexPath.row] as! NSDictionary
        NSLog("select event name: %@", event["name"] as! String)
    }


}
