//
//  ViewController.swift
//  Button Fun
//
//  Created by andyron on 28/09/2016.
//  Copyright © 2016 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let title = sender.title(for: .normal)!  // 当swift已经知道参数是枚举 UIControlState的一个值是可省略
        let text = "\(title) button pressed"
       
        
        let styledText = NSMutableAttributedString(string: text)
        let attributes = [
            NSFontAttributeName: UIFont.boldSystemFont(ofSize: statusLabel.font.pointSize)]
        
        let nameRange = (text as NSString).range(of: title);
        styledText.setAttributes(attributes, range: nameRange);
        
        statusLabel.attributedText = styledText
    
    }
    


}

