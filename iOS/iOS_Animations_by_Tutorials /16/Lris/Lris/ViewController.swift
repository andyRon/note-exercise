//
//  ViewController.swift
//  Lris
//
//  Created by [Andy Ron](https://github.com/andyRon)  on 2018/11/14.
//  Copyright © 2018 [Andy Ron](https://github.com/andyRon) . All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var meterLabel: UILabel!
    @IBOutlet weak var speakButton: UIButton!
    
    let monitor = MicMonitor()
    let assistant = Assistant()
    
    let replicator = CAReplicatorLayer()
    let dot = CALayer()
    
    let dotLength: CGFloat = 6.0
    let dotOffset: CGFloat = 8.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        replicator.frame = view.bounds
        view.layer.addSublayer(replicator)
        
        dot.frame = CGRect(x: replicator.frame.size.width - dotLength, y: replicator.position.y, width: dotLength, height: dotLength)
        dot.backgroundColor = UIColor.lightGray.cgColor
        dot.borderColor = UIColor(white: 1.0, alpha: 1.0).cgColor
        dot.borderWidth = 0.5
        dot.cornerRadius = 1.5
        
        replicator.addSublayer(dot)
        replicator.instanceCount = Int(view.frame.size.width / dotOffset)
        
        replicator.instanceTransform = CATransform3DMakeTranslation(-dotOffset, 0.0, 0.0)
        
        let move = CABasicAnimation(keyPath: "position.y")
        move.fromValue = dot.position.y
        move.toValue = dot.position.y - 50.0
        move.duration = 1.0
        move.repeatCount = 10
        dot.add(move, forKey: nil)
        
        replicator.instanceDelay = 0.02
    }

    @IBAction func actionStartMonitoring(_ sender: AnyObject) {
        print("StartMonitoring")
    }
    
    @IBAction func actionEndMonitoring(_ sender: AnyObject) {
        print("EndMonitoring")
        
        delay(seconds: 1.0) {
            self.startSpeaking()
        }
    }
    
    func startSpeaking() {
        print("speak back")
        
        let scale = CABasicAnimation(keyPath: "transform")
        scale.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
        scale.toValue = NSValue(caTransform3D: CATransform3DMakeScale(1.4, 15, 1.0))
        scale.duration = 0.33
        scale.repeatCount = .infinity
        scale.autoreverses = true
        scale.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        dot.add(scale, forKey: "dotScale")
        
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.fromValue = 1.0
        fade.toValue = 0.2
        fade.duration = 0.33
        fade.beginTime = CACurrentMediaTime() + 0.33
        fade.repeatCount = .infinity
        fade.autoreverses = true
        fade.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        dot.add(fade, forKey: "dotOpacity")
        
        let tint = CABasicAnimation(keyPath: "backgroundColor")
        tint.fromValue = UIColor.magenta.cgColor
        tint.toValue = UIColor.cyan.cgColor
        tint.duration = 0.66
        tint.beginTime = CACurrentMediaTime() + 0.28
        tint.fillMode = CAMediaTimingFillMode.backwards
        tint.repeatCount = .infinity
        tint.autoreverses = true
        tint.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        dot.add(tint, forKey: "dotColor")
        
        let initialRotation = CABasicAnimation(keyPath:
            "instanceTransform.rotation")
        initialRotation.fromValue = 0.0
        initialRotation.toValue   = 0.01
        initialRotation.duration = 0.33
        initialRotation.isRemovedOnCompletion = false
        initialRotation.fillMode = CAMediaTimingFillMode.forwards
        initialRotation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeOut)
        replicator.add(initialRotation, forKey: "initialRotation")
        
    }
    
    func endSpeaking() {
        
    }

}

