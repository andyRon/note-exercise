//
//  CustomCell.swift
//  CustomeCell
//
//  Created by andyron on 16/9/2.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
