//
//  ViewController.swift
//  BoundsCenter
//
//  Created by andyron on 2017/6/21.
//  Copyright © 2017年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v1 = UIView(frame: CGRect(x: 113, y: 111, width: 132, height: 194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        // insetBy表示产生一个同中心，但x，y中方向分别对称改变dx,dy大小的矩形，正数是减少，负数为增加
        let v2 = UIView(frame: v1.bounds.insetBy(dx: 10, dy: 10))
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        self.view.addSubview(v1)
        v1.addSubview(v2)
        
        // 由于中心没变，所以导致v2和v1相同大小
//        v2.bounds.size.height += 20
//        v2.bounds.size.width += 20
        
        v1.bounds.origin.x += 10
        v1.bounds.origin.y += 10
        
        print(v1.frame.origin, v1.center)
        print(v2.frame.origin, v2.center)
//        v2.bounds.origin.x -= 10
//        v2.bounds.origin.y -= 10
    }



}
