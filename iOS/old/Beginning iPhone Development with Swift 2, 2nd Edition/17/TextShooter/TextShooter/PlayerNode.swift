//
//  PlayerNode.swift
//  TextShooter
//
//  Created by andyron on 16/9/6.
//  Copyright © 2016年 andyron. All rights reserved.
//

import SpriteKit

class PlayerNode: SKNode {
    override init() {
        super.init()
        name = "Player \(self)"
        initNodeGraph()
        initPhysicsBody()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    // 初始射击者
    private func initNodeGraph() {
        // 射击点
        let label = SKLabelNode(fontNamed: "Courier")
        label.fontColor = SKColor.darkGrayColor()
        label.fontSize = 40
        label.text = "v"
        label.zRotation = CGFloat(M_PI)
        label.name = "name"
        self.addChild(label)
        
    }
    
    func moveToward(location: CGPoint) {
        removeActionForKey("movement")
        removeActionForKey("wobbling")
        
        let distance = pointDistance(position, location)
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let duration = NSTimeInterval(2 * distance/screenWidth)
        runAction(SKAction.moveTo(location, duration: duration),
                  withKey:"movement")
//        print(position, location)
        
        let wobbleTime = 0.3
        let halfWobbleTime = wobbleTime/2
        let wobbling = SKAction.sequence([SKAction.scaleXTo(0.2, duration: halfWobbleTime), SKAction.scaleXTo(1.0, duration: halfWobbleTime)])
        let wobbleCount = Int(duration/wobbleTime)
        runAction(SKAction.repeatAction(wobbling, count: wobbleCount), withKey: "wobbling")
        
    }
    
    func initPhysicsBody() {
        let body = SKPhysicsBody(rectangleOfSize: CGSizeMake(20, 20))
        body.affectedByGravity = false
        body.categoryBitMask = PlayerCategory
        body.contactTestBitMask = EnemyCategory
        body.collisionBitMask = 0
        physicsBody = body
    }

}
