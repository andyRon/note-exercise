//
//  AppStatusObserver.swift
//  KVO
//
//  Created by andyron on 2016/12/7.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class AppStatusObserver: NSObject {

//    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutableRawPointer) {
//        
//        NSLog("%@ - %@", keyPath!, (change![NSKeyValueChangeNewKey] as! String))
//    }
    
    // forKeyPath是被关注的属性， of是被关注的对象，chang是属性变化的内容
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        NSLog("%@ - %@", keyPath!, (change![NSKeyValueChangeKey.newKey] as! String))
    }
}
