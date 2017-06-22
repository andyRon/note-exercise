//
//  ViewController.swift
//  BoundsCenter
//
//  Created by andyron on 2017/6/21.
//  Copyright © 2017年 andyron. All rights reserved.
//

import UIKit

extension CGRect {
    init(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) {
        self.init(x: x, y: y, width: w, height: h)
    }
}

class ViewController: UIViewController {

    let which = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainview = self.view!
        switch which {
        case 1:
            let v1 = UIView(frame:CGRect(113, 111, 132, 194))
            v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            let v2 = UIView(frame:CGRect(41, 56, 132, 194))
            v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            let v3 = UIView(frame:CGRect(43, 197, 160, 230))
            v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
            mainview.addSubview(v1)
            v1.addSubview(v2)
            mainview.addSubview(v3)
        case 2:
            let v1 = UIView(frame:CGRect(113, 111, 132, 194))
            v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            // insetBy表示产生一个同中心，但x，y中方向分别对称改变dx,dy大小的矩形，正数是减少，负数为增加
            let v2 = UIView(frame:v1.bounds.insetBy(dx: 10, dy: 10))
            v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            mainview.addSubview(v1)
            v1.addSubview(v2)
        case 3:
            let v1 = UIView(frame:CGRect(113, 111, 132, 194))
            v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            let v2 = UIView(frame:v1.bounds.insetBy(dx: 10, dy: 10))
            v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            mainview.addSubview(v1)
            v1.addSubview(v2)
            // 由于中心没变，所以导致v2和v1相同大小
            v2.bounds.size.height += 20
            v2.bounds.size.width += 20
        case 4:
            // increased the superview’s origin in the positive direction, but the subview moved in the negative direction
            let v1 = UIView(frame:CGRect(113, 111, 132, 194))
            v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            let v2 = UIView(frame:v1.bounds.insetBy(dx: 10, dy: 10))
            v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            mainview.addSubview(v1)
            v1.addSubview(v2)
            print(v1.frame, v1.center, v1.bounds)
            print(v2.frame, v2.center, v2.bounds)

            v1.bounds.origin.x += 10
            v1.bounds.origin.y += 10
            
            print(v1.frame, v1.center, v1.bounds)
            print(v2.frame, v2.center, v2.bounds)
        case 5:
            // changing a view’s frame size affects its bounds size
            let v1 = UIView(frame:CGRect(113, 111, 132, 194))
            v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            let v2 = UIView(frame:v1.bounds.insetBy(dx: 10, dy: 10))
            v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            mainview.addSubview(v1)
            v1.addSubview(v2)
            print(v1.frame, v1.center, v1.bounds)
            print(v2.frame, v2.center, v2.bounds)
            
            v1.frame.size.width += 10
            v1.frame.size.height += 10
            
            print(v1.frame, v1.center, v1.bounds)
            print(v2.frame, v2.center, v2.bounds)
        case 6:
            // Changing a view’s bounds does not change its center
            let v1 = UIView(frame:CGRect(113, 111, 132, 194))
            v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            let v2 = UIView(frame:v1.bounds.insetBy(dx: 10, dy: 10))
            v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            mainview.addSubview(v1)
            v1.addSubview(v2)

            print(v2.frame, v2.center, v2.bounds)
            
            v2.bounds.size.width += 10
            v2.bounds.size.height += 10

            print(v2.frame, v2.center, v2.bounds)
        case 7:
            // changing a view’s center does not change its bounds
            let v1 = UIView(frame:CGRect(113, 111, 132, 194))
            v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            let v2 = UIView(frame:v1.bounds.insetBy(dx: 10, dy: 10))
            v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            mainview.addSubview(v1)
            v1.addSubview(v2)
            
            print(v2.frame, v2.center, v2.bounds)
            
            v2.center.x += 10
            v2.center.y += 10
            
            print(v2.frame, v2.center, v2.bounds)
            
        case 8:
            let v1 = UIView(frame:CGRect(113, 111, 132, 194))
            v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
            // insetBy表示产生一个同中心，但x，y中方向分别对称改变dx,dy大小的矩形，正数是减少，负数为增加
            let v2 = UIView(frame:v1.bounds.insetBy(dx: 10, dy: 10))
            v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
            mainview.addSubview(v1)
            v1.addSubview(v2)
            
            print(v1.frame, v1.center, v1.bounds)
            print(v2.frame, v2.center, v2.bounds)
            v2.center = v1.convert(v1.center, from: v1.superview)
            
            print(v1.frame, v1.center, v1.bounds)
            print(v2.frame, v2.center, v2.bounds)
            
//            let screen = UIScreen.main.fixedCoordinateSpace
//        
//            print(screen)
        default:
            break
        }
        
//        v2.bounds.origin.x -= 10
//        v2.bounds.origin.y -= 10
        
//        UIScreen.main.coordinateSpace
//        self.view.transform
    }



}
