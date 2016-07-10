//
//  NameAndColorCell.swift
//  Table Cells
//
//  Created by andyron on 16/7/10.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class NameAndColorCell: UITableViewCell {
    
    var name: String = "" {
        didSet {
            if name != oldValue {
                nameLabel?.text = name
            }
        }
    }
    
    /**
     nameLabel.text = name
     
     fatal error: unexpectedly found nil while unwrapping an Optional value
     (lldb)
     
     
     */
    
    var color: String = "" {
        didSet {
            if color != oldValue {
                colorLabel?.text = color
            }
        }
    }
    var nameLabel: UILabel!
    var colorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let nameLabelRect = CGRectMake(0, 5, 70, 15)
        let nameMaker = UILabel(frame: nameLabelRect)
        nameMaker.textAlignment = NSTextAlignment.Right
        nameMaker.text = "Name:"
        nameMaker.font = UIFont.boldSystemFontOfSize(12)
        contentView.addSubview(nameMaker)
        
        let colorLabelRect = CGRectMake(0, 26, 70, 15)
        let colorMaker = UILabel(frame: colorLabelRect)
        colorMaker.textAlignment = NSTextAlignment.Right
        colorMaker.text = "Color:"
        colorMaker.font = UIFont.boldSystemFontOfSize(12)
        contentView.addSubview(colorMaker)
        
        let nameValueRect = CGRectMake(80, 5, 200, 15)
        let nameValue = UILabel(frame: nameValueRect)
        contentView.addSubview(nameValue)
        
        let colorValueRect = CGRectMake(80, 26, 200, 15)
        let colorValue = UILabel(frame: colorValueRect)
        contentView.addSubview(colorValue)
        
    }
    //?? 执行的原因
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
