//
//  BallView.swift
//  Ball
//
//  Created by andyron on 9/14/16.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit
import CoreMotion

class BallView: UIView {
    var acceleration = CMAcceleration(x: 0, y: 0, z: 0)
    fileprivate let image = UIImage(named: "ball")!
    fileprivate var currentPoint: CGPoint = CGPoint.zero {
        didSet {
            var newX = currentPoint.x
            var newY = currentPoint.y
            if newX < 0 {
                newX = 0
                ballXVelocity = 0
            } else if newX > bounds.size.width - image.size.width {
                newX = bounds.size.width - image.size.width
                ballXVelocity = 0
            }
            if newY < 0 {
                newY = 0
                ballXVelocity = 0
            } else if newY > bounds.size.height - image.size.height {
                newY = bounds.size.height - image.size.height
                ballXVelocity = 0
            }
            currentPoint = CGPoint(x: newX, y: newY)
            
            let currentRect = CGRect(x: newX, y: newY, width: newX + image.size.width, height: newY + image.size.height)
            let prevRect = CGRect(x: oldValue.x, y: oldValue.y, width: oldValue.x + image.size.width, height: image.size.height)
            setNeedsDisplay(currentRect.union(prevRect))
        }
    }
    fileprivate var ballXVelocity = 0.0
    fileprivate var ballYVelocity = 0.0
    fileprivate var lastUpdateTime = Date()
    
    
    fileprivate func commonInit() -> Void {
        currentPoint = CGPoint(x: (bounds.size.width / 2) + (image.size.width / 2), y: (bounds.size.height / 2) + (image.size.height / 2))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    override func draw(_ rect: CGRect) {
        image.draw(at: currentPoint)
    }
    
    func update() -> Void {
        let now = Date()
        let secondsSinceLastDraw = now.timeIntervalSince(lastUpdateTime)
        ballXVelocity = ballXVelocity + (acceleration.x * secondsSinceLastDraw)
        ballYVelocity = ballYVelocity - (acceleration.y * secondsSinceLastDraw)
        
        let xDelta = secondsSinceLastDraw * ballXVelocity * 500
        let yDelta = secondsSinceLastDraw * ballYVelocity * 500
        currentPoint = CGPoint(x: currentPoint.x + CGFloat(xDelta), y: currentPoint.y + CGFloat(yDelta))
        lastUpdateTime = now
    }
}
