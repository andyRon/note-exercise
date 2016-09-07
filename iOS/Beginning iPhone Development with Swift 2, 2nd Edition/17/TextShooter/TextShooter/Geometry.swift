//
//  Geometry.swift
//  TextShooter
//
//  Created by andyron on 16/9/6.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

// 矢量的倍数
func vectorMultiply(v: CGVector, _ m: CGFloat) -> CGVector {
    return CGVectorMake(v.dx * m, v.dy * m)
}

// 两点相连的矢量, 创建矢量
func vectorBetweenPoints(p1: CGPoint, _ p2: CGPoint) -> CGVector {
    return CGVectorMake(p2.x - p1.x, p2.y - p1.y)
}

// 矢量的长度
func vectorLength(v: CGVector) ->CGFloat {
    return CGFloat(sqrt(powf(Float(v.dx), 2) + sqrt(powf(Float(v.dy), 2))))
}

// 勾股定理
// 两点之间的距离
func pointDistance(p1: CGPoint, _ p2: CGPoint) -> CGFloat {
    return CGFloat(sqrt(powf(Float(p2.x - p1.x), 2) + sqrt(powf(Float(p2.y - p2.x), 2))))
}

