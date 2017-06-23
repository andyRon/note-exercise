//
//  QuartzFunView.swift
//  QuartzFun
//
//  Created by andyron on 16/9/5.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class QuartzFunView: UIView {
    
    var shape = Shape.Line
    var currentColor = UIColor.redColor()
    var useRandomColor = false
    
    private let image = UIImage(named: "iphone")
    private var firstTouchLocation = CGPointZero
    private var lastTouchLocation = CGPointZero
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            if useRandomColor {
                currentColor = UIColor.randomColor()
            }
            firstTouchLocation = touch.locationInView(self)
            lastTouchLocation = firstTouchLocation
            setNeedsDisplay()
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            lastTouchLocation = touch.locationInView(self)
            setNeedsDisplay()
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            lastTouchLocation = touch.locationInView(self)
            setNeedsDisplay()
        }
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 2.0)
        CGContextSetStrokeColorWithColor(context, currentColor.CGColor)
        CGContextSetFillColorWithColor(context, currentColor.CGColor)
        let currentRect = CGRectMake(firstTouchLocation.x, firstTouchLocation.y, lastTouchLocation.x - firstTouchLocation.x, lastTouchLocation.y - firstTouchLocation.y)
        
        switch shape {
        case .Line:
            CGContextMoveToPoint(context, firstTouchLocation.x, firstTouchLocation.y)
            
            CGContextAddLineToPoint(context, lastTouchLocation.x, lastTouchLocation.y)
            
            CGContextStrokePath(context)
            
        case .Rect:
            CGContextAddRect(context, currentRect)
            CGContextDrawPath(context, .FillStroke)
            
        case .Ellipse:
            CGContextAddEllipseInRect(context, currentRect)
            CGContextDrawPath(context, .FillStroke)
            
        case .Image:
            let horizontalOffset = image!.size.width/2
            let verticalOffset = image!.size.height/2
            let drawPoint = CGPointMake(lastTouchLocation.x - horizontalOffset, lastTouchLocation.y - verticalOffset)
            image!.drawAtPoint(drawPoint)
        }
    }
    

}
// 对UIColor的扩展，随机颜色
extension UIColor {
    class func randomColor() -> UIColor {
        let red = CGFloat(Double(arc4random_uniform(255))/255)
        let blue = CGFloat(Double(arc4random_uniform(255))/255)
        let green = CGFloat(Double(arc4random_uniform(255))/255)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
// 形状枚举，对应形状segment
enum Shape: UInt {
    case Line = 0, Rect, Ellipse, Image
}
// 颜色枚举，对应颜色segment
enum DrawingColor: UInt {
    case Red = 0, Blue, Yellow, Green, Random
}



