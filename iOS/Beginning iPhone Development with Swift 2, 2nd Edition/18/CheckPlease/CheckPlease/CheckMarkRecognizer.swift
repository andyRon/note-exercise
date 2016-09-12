//
//  CheckMarkRecognizer.swift
//  CheckPlease
//
//  Created by andyron on 9/12/16.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit
// 是因为 UIGestureRecognizerSubclass是UIKit的扩展才可以这样写吗！？
import UIKit.UIGestureRecognizerSubclass


class CheckMarkRecognizer: UIGestureRecognizer {
    // 勾左边的线长度最小值
    private static let minimumCheckMarkLengthDown = CGFloat(30)
     // 勾右边的线长度最小值
    private static let minimumCheckMarkLengthUp = CGFloat(50)
    private static let tolerance = CGFloat(16)
    private var startPoint = CGPointZero
    private var turnPoint: CGPoint? = nil
    // 移动过程中按压屏幕的最大值
    var greatestForce = CGFloat(0)
    
    var maxPossibleForce = CGFloat(0)
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        if let touch = touches.first {
            startPoint = touch.locationInView(view)
            turnPoint = nil
            greatestForce = 0
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent) {
        super.touchesMoved(touches, withEvent: event)
        if let touch = touches.first {
            let currentPoint = touch.locationInView(view)
            // 注意不要搞错
//            let previousPoint = touch.preciseLocationInView(view)
            let previousPoint = touch.previousLocationInView(view)
            if turnPoint == nil {
                let distanceFromStart = distanceBetweenPoints(first: startPoint, second: currentPoint)
                if (currentPoint.x <= startPoint.x || currentPoint.y <= startPoint.y) && distanceFromStart > CheckMarkRecognizer.tolerance {
                    state = .Failed
                }
                
                if distanceFromStart > CheckMarkRecognizer.minimumCheckMarkLengthDown && currentPoint.x > previousPoint.x && currentPoint.y > previousPoint.y {
                    turnPoint = previousPoint
                }
            } else {
                let distanceFromTurn = distanceBetweenPoints(first: turnPoint!, second: currentPoint)
                if currentPoint.x > previousPoint.x && currentPoint.y < previousPoint.y && distanceFromTurn >= CheckMarkRecognizer.minimumCheckMarkLengthUp {
                    state = .Ended
                }
            }
            
            if touch.view?.traitCollection.forceTouchCapability == .Available && touch.force > greatestForce {
                greatestForce = touch.force
                maxPossibleForce = touch.maximumPossibleForce
            }
        }
    }
    
    private func distanceBetweenPoints(first first: CGPoint, second: CGPoint) -> CGFloat {
        let deltaX = second.x - first.x
        let deltaY = second.y - first.y
//        print(sqrt(deltaX * deltaX + deltaY * deltaY))
        return sqrt(deltaX * deltaX + deltaY * deltaY)
    }
    

}
