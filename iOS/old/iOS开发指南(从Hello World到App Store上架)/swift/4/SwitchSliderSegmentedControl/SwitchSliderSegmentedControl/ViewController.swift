//
//  ViewController.swift
//  SwitchSliderSegmentedControl
//
//  Created by andyron on 16/8/19.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var sliderValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func switchValueChanged(sender: AnyObject) {
        var withSwitch = sender as! UISwitch
        var setting = withSwitch.on
        self.leftSwitch.setOn(setting, animated: true)
        self.rightSwitch.setOn(setting, animated: true)
    }
    
    @IBAction func touchDown(sender: AnyObject) {
        let segmentControl = sender as! UISegmentedControl
        
        NSLog("选择的段: %li", segmentControl.selectedSegmentIndex)
        
        if (self.leftSwitch.hidden == true) {
            self.rightSwitch.hidden = false
            self.leftSwitch.hidden = false
        } else {
            self.leftSwitch.hidden = true
            self.rightSwitch.hidden = true
        }
        
    }
    
    @IBAction func sliderValueChange(sender: AnyObject) {
        var slider = sender as! UISlider
        let progressAsInt = Int(slider.value)
        let newText = NSString(format: "%d", progressAsInt)
        self.sliderValue.text = newText as String
    }
}

