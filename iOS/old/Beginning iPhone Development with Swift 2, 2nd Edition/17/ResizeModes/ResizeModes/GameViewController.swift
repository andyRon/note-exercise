//
//  GameViewController.swift
//  ResizeModes
//
//  Created by andyron on 16/9/6.
//  Copyright (c) 2016年 andyron. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            /*
             SKSceneScaleMode.AspectFill    保持宽高比例填充(可能有一部分消失)
             SKSceneScaleMode.Fill  全部填充到屏幕（会有点挤)
             SKSceneScaleMode.AspectFit 保持宽高比例，且保持所有元素显示，结果可能是a letter-box view
             SKSceneScaleMode.ResizeFill 原始尺寸显示
            */
            
            skView.presentScene(scene)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
