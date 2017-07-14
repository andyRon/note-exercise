//
//  GameScene.swift
//  TextShooter
//
//  Created by andyron on 16/9/5.
//  Copyright (c) 2016年 andyron. All rights reserved.
//

import SpriteKit
// 游戏画面构建
class GameScene: SKScene, SKPhysicsContactDelegate {
    private var levelNumber: Int
    private var playerLives: Int {
        didSet {
            let lives = childNodeWithName("LivesLabel") as! SKLabelNode
            lives.text = "Lives: \(playerLives)"
        }
    }
    private var finished = false
    
    private let playerNode: PlayerNode = PlayerNode()
    
    private let enemies = SKNode()
    
    private let playerBullets = SKNode()
    
    class func sence(size: CGSize, levelNumber: Int) -> GameScene {
        return GameScene(size: size, levelNumber: levelNumber)
    }
    
    override convenience init(size: CGSize) {
        self.init(size: size, levelNumber: 1)
    }
    
    init(size: CGSize, levelNumber: Int) {
        self.levelNumber = levelNumber
        self.playerLives = 5
        super.init(size: size)
        
        backgroundColor = SKColor.lightGrayColor()
        let lives = SKLabelNode(fontNamed: "Courier")
        lives.fontSize = 16
        lives.fontColor = SKColor.blackColor()
        lives.name = "LivesLabel"
        lives.text = "Lives: \(playerLives)"
        lives.verticalAlignmentMode = .Top
        lives.horizontalAlignmentMode = .Right
        lives.position = CGPointMake(frame.size.width, frame.size.height)
        
        addChild(lives)
        
        let level = SKLabelNode(fontNamed: "Courier")
        level.fontSize = 16
        level.fontColor = SKColor.blackColor()
        level.name = "LevelLabel"
        level.text = "Level \(levelNumber)"
        level.verticalAlignmentMode = .Top
        level.horizontalAlignmentMode = .Left
        level.position = CGPointMake(0, frame.height)
        
        addChild(level)
        
        playerNode.position = CGPointMake(CGRectGetMidX(frame), CGRectGetHeight(frame) * 0.1)
        addChild(playerNode)
        
        addChild(enemies)
        spawnEnemies()
        
        addChild(playerBullets)
        
        physicsWorld.gravity = CGVectorMake(0, -1)
        physicsWorld.contactDelegate = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        levelNumber = aDecoder.decodeIntegerForKey("level")
        playerLives = aDecoder.decodeIntegerForKey("playerLives")
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            if location.y < CGRectGetHeight(frame) * 0.2 {
                let target = CGPointMake(location.x, playerNode.position.y)
                playerNode.moveToward(target)
            } else {
                let bullet = BulletNode.bullet(from: playerNode.position, toward: location)
                playerBullets.addChild(bullet)
            }
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
//            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if finished {
            return
        }
        updateBullets()
        
        updateEnemies()
        checkForNextLevel()
        
        if (!checkForGameOver()) {
            checkForNextLevel()
        }
        
    }
    
    // 创建n个敌人
    private func spawnEnemies() {
        let count = Int(log(Float(levelNumber))) + levelNumber
        print(count)
        
        for _ in 0..<count {
            let enemy = EnemyNode()
            let size = frame.size
            let x = arc4random_uniform(UInt32(size.width * 0.8)) + UInt32(size.width * 0.1)
            let y = arc4random_uniform(UInt32(size.height * 0.5)) + UInt32(size.height * 0.5)
            enemy.position = CGPointMake(CGFloat(x), CGFloat(y))
            print(x, y)
            enemies.addChild(enemy)
        }
    }
    
    private func updateBullets() {
        var bulletsToRemove: [BulletNode] = []
        for bullet in playerBullets.children as! [BulletNode] {
            if !CGRectContainsPoint(frame, bullet.position) {
                bulletsToRemove.append(bullet)
                continue
            }
            
            bullet.appleRecurringForce()
        }
        playerBullets.removeChildrenInArray(bulletsToRemove)
    }
    
    private func updateEnemies() {
        var enemiesToRemove: [EnemyNode] = []
        for node in enemies.children as! [EnemyNode] {
            if !CGRectContainsPoint(frame, node.position) {
                enemiesToRemove.append(node)
            }
        }
        
        enemies.removeChildrenInArray(enemiesToRemove)
    }
    
    private func checkForNextLevel() {
        if enemies.children.isEmpty {
            goToNextLevel()
        }
    }
    
    private func goToNextLevel() {
        finished = true
        
        let label = SKLabelNode(fontNamed: "Courier")
        label.text = "Level complete!"
        label.fontSize = 32
        label.fontColor = SKColor.blueColor()
        label.position = CGPointMake(frame.size.width * 0.5, frame.size.height * 0.5)
        addChild(label)
        
        let nextLabel = GameScene(size: frame.size, levelNumber: levelNumber + 1)
        nextLabel.playerLives = playerLives
        view!.presentScene(nextLabel, transition: SKTransition.flipVerticalWithDuration(1.0))
    }
    //###MARK --SKPhysicsContactDelegate
    func didBeginContact(contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == contact.bodyB.categoryBitMask {
            let nodeA = contact.bodyA.node!
            let nodeB = contact.bodyB.node!
            
            nodeA.friendlyBumpFrom(nodeB)
            nodeA.friendlyBumpFrom(nodeA)
            
        } else {
            var attacker: SKNode
            var attackee: SKNode
            
            if contact.bodyA.categoryBitMask > contact.bodyB.categoryBitMask {
                attacker = contact.bodyA.node!
                attackee = contact.bodyB.node!
            } else {
                attacker = contact.bodyB.node!
                attackee = contact.bodyA.node!
            }
            
            if attackee is PlayerNode {
                playerLives -= 1
            }
            
            
            attackee.receiveAttacker(attacker, contact: contact)
            playerBullets.removeChildrenInArray([attacker])
            enemies.removeChildrenInArray([attacker])
        }
    }
    
    
    private func triggerGameOver() {
        finished = true
        let path = NSBundle.mainBundle().pathForResource("EnemyExplosion",
                                                         ofType: "sks")
        let explosion = NSKeyedUnarchiver.unarchiveObjectWithFile(path!)
            as! SKEmitterNode
        explosion.numParticlesToEmit = 200
        explosion.position = playerNode.position
        scene!.addChild(explosion)
        playerNode.removeFromParent()
        let transition = SKTransition.doorsOpenVerticalWithDuration(1)
        let gameOver = GameOverScene(size: frame.size)
        view!.presentScene(gameOver, transition: transition)
    }
    
    private func checkForGameOver() -> Bool {
        if playerLives == 0 {
            triggerGameOver()
            return true }
        return false
    }
    
}
