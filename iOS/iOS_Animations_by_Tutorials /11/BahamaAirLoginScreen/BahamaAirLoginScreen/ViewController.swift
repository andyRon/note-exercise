//
//  ViewController.swift
//  Packing List
//
//  Created by [Andy Ron](https://github.com/andyRon)  on 2018/10/23.
//  Copyright © 2018 [Andy Ron](https://github.com/andyRon) . All rights reserved.
//

import UIKit

// A delay function
func delay(seconds: Double, completion: @escaping ()-> Void) {
  DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

func roundCorners(layer: CALayer, toRadius: CGFloat) {
    let round = CASpringAnimation(keyPath: "cornerRadius")
    round.damping = 5.0
    round.fromValue = layer.cornerRadius
    round.toValue = toRadius
    round.duration = round.settlingDuration
    layer.add(round, forKey: nil)
    layer.cornerRadius = toRadius
}

func tintBackgroundColor(layer: CALayer, toColor: UIColor) {
    let tint = CASpringAnimation(keyPath: "backgroundColor")
    tint.damping = 5.0
    tint.initialVelocity = -10.0
    tint.fromValue = layer.backgroundColor
    tint.toValue = toColor.cgColor
    tint.duration = tint.settlingDuration
    layer.add(tint, forKey: nil)
    layer.backgroundColor = toColor.cgColor
}

class ViewController: UIViewController {

  // MARK: IB outlets

  @IBOutlet var loginButton: UIButton!
  @IBOutlet var heading: UILabel!
  @IBOutlet var username: UITextField!
  @IBOutlet var password: UITextField!

  @IBOutlet var cloud1: UIImageView!
  @IBOutlet var cloud2: UIImageView!
  @IBOutlet var cloud3: UIImageView!
  @IBOutlet var cloud4: UIImageView!

  // MARK: further UI

  let spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
  let status = UIImageView(image: UIImage(named: "banner"))
  let label = UILabel()
  let messages = ["Connecting ...", "Authorizing ...", "Sending credentials ...", "Failed"]

  var statusPosition = CGPoint.zero

  /// 提示信息
  let info = UILabel()
    
  override func viewDidLoad() {
    super.viewDidLoad()

    //set up the UI
    loginButton.layer.cornerRadius = 8.0
    loginButton.layer.masksToBounds = true

    spinner.frame = CGRect(x: -20.0, y: 6.0, width: 20.0, height: 20.0)
    spinner.startAnimating()
    spinner.alpha = 0.0
    loginButton.addSubview(spinner)

    status.isHidden = true
    status.center = loginButton.center
    view.addSubview(status)

    label.frame = CGRect(x: 0.0, y: 0.0, width: status.frame.size.width, height: status.frame.size.height)
    label.font = UIFont(name: "HelveticaNeue", size: 18.0)
    label.textColor = UIColor(red: 0.89, green: 0.38, blue: 0.0, alpha: 1.0)
    label.textAlignment = .center
    status.addSubview(label)

    statusPosition = status.center
    
    // 配置提示信息Label
    info.frame = CGRect(x: 0.0, y: loginButton.center.y + 60.0, width: view.frame.size.width, height: 30)
    info.backgroundColor = UIColor.clear
    info.font = UIFont(name: "HelveticaNeue", size: 12.0)
    info.textAlignment = .center
    info.textColor = .white
    info.text = "Tap on a field and enter username and password"
    view.insertSubview(info, belowSubview: loginButton)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    let formGroup = CAAnimationGroup()
    formGroup.duration = 0.5
    formGroup.fillMode = kCAFillModeBackwards
    
    let flyRight = CABasicAnimation(keyPath: "position.x")
    flyRight.fromValue = -view.bounds.size.width/2
    flyRight.toValue = view.bounds.size.width/2
    
    let fadeFieldIn = CABasicAnimation(keyPath: "opacity")
    fadeFieldIn.fromValue = 0.25
    fadeFieldIn.toValue = 1.0
    
    formGroup.animations = [flyRight, fadeFieldIn]
    heading.layer.add(formGroup, forKey: nil)
    
    formGroup.delegate = self
    formGroup.setValue("form", forKey: "name")
    formGroup.setValue(username.layer, forKey: "layer")
    
    formGroup.beginTime = CACurrentMediaTime() + 0.3
    username.layer.add(formGroup, forKey: nil)
    
    formGroup.setValue(password.layer, forKey: "layer")
    formGroup.beginTime = CACurrentMediaTime() + 0.4
    password.layer.add(formGroup, forKey: nil)

  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    UIView.animate(withDuration: 0.5, delay: 0.5,
      animations: {
        self.cloud1.alpha = 1.0
      },
      completion: nil
    )

    UIView.animate(withDuration: 0.5, delay: 0.7,
      animations: {
        self.cloud2.alpha = 1.0
      },
      completion: nil
    )

    UIView.animate(withDuration: 0.5, delay: 0.9,
      animations: {
        self.cloud3.alpha = 1.0
      },
      completion: nil
    )

    UIView.animate(withDuration: 0.5, delay: 1.1,
      animations: {
        self.cloud4.alpha = 1.0
      },
      completion: nil
    )
    
    // 对login按钮定义一组组动画
    let groupAnimation = CAAnimationGroup()
    groupAnimation.beginTime = CACurrentMediaTime() + 0.5
    groupAnimation.duration = 0.5
    groupAnimation.fillMode = kCAFillModeBackwards
    groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
    
    let scaleDown = CABasicAnimation(keyPath: "transform.scale")
    scaleDown.fromValue = 3.5
    scaleDown.toValue = 1.0
    
    let rotate = CABasicAnimation(keyPath: "transform.rotation")
    rotate.fromValue = .pi / 4.0
    rotate.toValue = 0.0
    
    let fade = CABasicAnimation(keyPath: "opacity")
    fade.fromValue = 0.0
    fade.toValue = 1.0
    
    groupAnimation.animations = [scaleDown, rotate, fade]
    loginButton.layer.add(groupAnimation, forKey: nil)

    animateCloud(layer: cloud1.layer)
    animateCloud(layer: cloud2.layer)
    animateCloud(layer: cloud3.layer)
    animateCloud(layer: cloud4.layer)

    
    // 给提示信息Label添加动画
    let flyLeft = CABasicAnimation(keyPath: "position.x")
    flyLeft.fromValue = info.layer.position.x + view.frame.size.width
    flyLeft.toValue = info.layer.position.x
    flyLeft.duration = 5.0
//    flyLeft.repeatCount = 2.5     // 动画重复次数，0.5是为了解决最后突然跳到中间的问题
//    flyLeft.autoreverses = true
//    flyLeft.speed = 2.0
//    info.layer.speed = 2.0
    info.layer.add(flyLeft, forKey: "infoappear")
    
    // 给提示信息Label添加第二个动画
    let fadeLabelIn = CABasicAnimation(keyPath: "opacity")
    fadeLabelIn.fromValue = 0.2
    fadeLabelIn.toValue = 1.0
    fadeLabelIn.duration = 4.5
    info.layer.add(fadeLabelIn, forKey: "fadein")
    
    username.delegate = self
    password.delegate = self
  }

  func showMessage(index: Int) {
    label.text = messages[index]

    UIView.transition(with: status, duration: 0.33,
      options: [.curveEaseOut, .transitionFlipFromBottom],
      animations: {
        self.status.isHidden = false
      },
      completion: {_ in
        //transition completion
        delay(seconds: 2.0) {
          if index < self.messages.count-1 {
            self.removeMessage(index: index)
          } else {
            //reset form
            self.resetForm()
          }
        }
      }
    )
  }

  func removeMessage(index: Int) {

    UIView.animate(withDuration: 0.33, delay: 0.0,
      animations: {
        self.status.center.x += self.view.frame.size.width
      },
      completion: {_ in
        self.status.isHidden = true
        self.status.center = self.statusPosition

        self.showMessage(index: index+1)
      }
    )
  }

  func resetForm() {
    UIView.transition(with: status, duration: 0.2, options: .transitionFlipFromTop,
      animations: {
        self.status.isHidden = true
        self.status.center = self.statusPosition
      },
      completion: { _ in
        let tintColor = UIColor(red: 0.63, green: 0.84, blue: 0.35, alpha: 1.0)
        tintBackgroundColor(layer: self.loginButton.layer, toColor: tintColor)
        roundCorners(layer: self.loginButton.layer, toRadius: 10.0)
    }
        
    )

    UIView.animate(withDuration: 0.2, delay: 0.0,
      animations: {
        self.spinner.center = CGPoint(x: -20.0, y: 16.0)
        self.spinner.alpha = 0.0
        self.loginButton.backgroundColor = UIColor(red: 0.63, green: 0.84, blue: 0.35, alpha: 1.0)
        self.loginButton.bounds.size.width -= 80.0
        self.loginButton.center.y -= 60.0
      },
      completion: nil
    )
  }

  // MARK: further methods

  @IBAction func login() {
    view.endEditing(true)

    UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.2,
      initialSpringVelocity: 0.0,
      animations: {
        self.loginButton.bounds.size.width += 80.0
      },
      completion: {_ in
        self.showMessage(index: 0)
      }
    )

    UIView.animate(withDuration: 0.33, delay: 0.0, usingSpringWithDamping: 0.7,
      initialSpringVelocity: 0.0,
      animations: {
        self.loginButton.center.y += 60.0
        self.loginButton.backgroundColor = UIColor(red: 0.85, green: 0.83, blue: 0.45, alpha: 1.0)
        self.spinner.center = CGPoint(x: 40.0, y: self.loginButton.frame.size.height/2)
        self.spinner.alpha = 1.0
      },
      completion: nil
    )
    let tintColor = UIColor(red: 0.85, green: 0.83, blue: 0.45, alpha: 1.0)
    tintBackgroundColor(layer: loginButton.layer, toColor: tintColor)
    roundCorners(layer: loginButton.layer, toRadius: 25.0)
  }

  func animateCloud(_ cloud: UIImageView) {
    let cloudSpeed = 60.0 / view.frame.size.width
    let duration = (view.frame.size.width - cloud.frame.origin.x) * cloudSpeed
    UIView.animate(withDuration: TimeInterval(duration), delay: 0.0, options: .curveLinear,
      animations: {
        cloud.frame.origin.x = self.view.frame.size.width
      },
      completion: {_ in
        cloud.frame.origin.x = -cloud.frame.size.width
        self.animateCloud(cloud)
      }
    )
  }
    
    func animateCloud(layer: CALayer) {
        let cloudSpeed = 60.0 / Double(view.layer.frame.size.width)
        let duration: TimeInterval = Double(view.layer.frame.size.width - layer.frame.origin.x) * cloudSpeed
        
        let cloudMove = CABasicAnimation(keyPath: "position.x")
        cloudMove.duration = duration
        cloudMove.toValue = self.view.bounds.width + layer.bounds.width/2
        cloudMove.delegate = self
        cloudMove.setValue("cloud", forKey: "name")
        cloudMove.setValue(layer, forKey: "layer")
        layer.add(cloudMove, forKey: nil)
    }

  // MARK: UITextFieldDelegate

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    let nextField = (textField === username) ? password : username
    nextField?.becomeFirstResponder()
    return true
  }

}

extension ViewController: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print(anim.description, "动画完成")
        guard let name = anim.value(forKey: "name") as? String else {
            return
        }
        if name == "form" {
            // `value(forKey:)`的结果总是`Any`，因此需要转换为所需类型
            let layer = anim.value(forKey: "layer") as? CALayer
            anim.setValue(nil, forKey: "layer")
            // 简单的脉动动画
            let pulse = CASpringAnimation(keyPath: "transform.scale")
            pulse.damping = 7.5
            pulse.fromValue = 1.25
            pulse.toValue = 1.0
            pulse.duration = pulse.settlingDuration
            layer?.add(pulse, forKey: nil)
        }
        
        if name == "cloud" {
            if let layer = anim.value(forKey: "layer") as? CALayer {
                anim.setValue(nil, forKey: "layer")
                
                layer.position.x = -layer.bounds.width/2
                delay(seconds: 0.5) {
                    self.animateCloud(layer: layer)
                }
            }
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let runningAnimations = info.layer.animationKeys() else {
            return
        }
        print(runningAnimations)
        info.layer.removeAnimation(forKey: "infoappear")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard  let text = textField.text else {
            return
        }
        if text.count < 5 {
            // 文本框验证跳动动画
            let jump = CASpringAnimation(keyPath: "position.y")
            jump.fromValue = textField.layer.position.y + 1.0
            jump.toValue = textField.layer.position.y
            
            jump.initialVelocity = 100.0
            jump.mass = 10.0
            jump.stiffness = 1500.0
            jump.damping = 50.0
            
            jump.duration = jump.settlingDuration
            textField.layer.add(jump, forKey: nil)
            
            //文本框边验证颜色变化动画
            textField.layer.borderWidth = 3.0
            textField.layer.borderColor = UIColor.clear.cgColor
            let flash = CASpringAnimation(keyPath: "borderColor")
            flash.damping = 7.0
            flash.stiffness = 200.0
            flash.fromValue = UIColor(red: 1.0, green: 0.27, blue: 0.0, alpha: 1.0).cgColor
            flash.toValue = UIColor.white.cgColor
            flash.duration = flash.settlingDuration
            textField.layer.add(flash, forKey: nil)
            
        }
    }
}
