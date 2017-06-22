//
//  ViewController.swift
//  Transform
//
//  Created by andyron on 2017/6/22.
//  Copyright © 2017年 andyron. All rights reserved.
//

import UIKit

extension CGRect {
    init(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) {
        self.init(x: x, y: y, width: w, height: h)
    }
}

class ViewController: UIViewController {

    let which = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mainview = self.view!
        switch which {
        case 1:
            let v1 = UIView(frame:CGRect(113, 111, 132, 194))
            v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            let v2 = UIView(frame:v1.bounds.insetBy(dx: 10, dy: 10))
            v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            mainview.addSubview(v1)
            v1.addSubview(v2)
            print(v1.frame, v1.center, v1.bounds)

            // pi表示CGFloat的一个类型属性
            v1.transform = CGAffineTransform(rotationAngle:45/180 * .pi)
            print(v1.frame, v1.center, v1.bounds)
            
            print(CGFloat.pi)
            
        case 2:
            let v1 = UIView(frame:CGRect(113, 111, 132, 194))
            v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            let v2 = UIView(frame:v1.bounds.insetBy(dx: 10, dy: 10))
            v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            mainview.addSubview(v1)
            v1.addSubview(v2)
            
            print(v1.frame, v1.center, v1.bounds)

            // 宽度被拉伸1.8倍，center没有变，frame.origin.x变成  113 - 132*0.8/2
            v1.transform = CGAffineTransform(scaleX: 1.8, y: 1)
            print(v1.frame, v1.center, v1.bounds)
            
        case 3:
            let v1 = UIView(frame:CGRect(20, 111, 132, 194))
            v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            let v2 = UIView(frame:v1.bounds)
            v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            mainview.addSubview(v1)
            v1.addSubview(v2)
            
            v2.transform = CGAffineTransform(translationX: 100, y: 0).rotated(by: 45/180 * .pi)
            
        case 4:
            let v1 = UIView(frame:CGRect(20, 111, 132, 194))
            v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            let v2 = UIView(frame:v1.bounds)
            v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            mainview.addSubview(v1)
            v1.addSubview(v2)
            // 先转到45度后，再移动距离时，移动方向也变成45度的方向
//            v2.transform = CGAffineTransform(rotationAngle: 45/180 * .pi).translatedBy(x: 100, y: 0)
            
            
            let r = CGAffineTransform(rotationAngle:45 * .pi/180)
            let t = CGAffineTransform(translationX:100, y:0)
            v2.transform = t.concatenating(r) // not r.concatenating(t)
        default:
            break
        }
    }




}

