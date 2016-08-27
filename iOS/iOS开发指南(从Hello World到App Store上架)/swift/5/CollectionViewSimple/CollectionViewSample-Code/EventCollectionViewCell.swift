//
//  EventCollectionViewCell.swift
//  CollectionViewSimple
//
//  Created by andyron on 16/8/27.
//  Copyright © 2016年 andyron. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    var label: UILabel!
    
    override  init(frame: CGRect) {
        super.init(frame: frame)
        
        // 1.添加ImageView
        let cellWidth: CGFloat = self.frame.size.width
        
        let imageViewWidth: CGFloat = 101
        let imageViewHeight: CGFloat = 101
        let imageViewTopView: CGFloat = 15
        
        self.imageView = UIImageView(frame: CGRectMake((cellWidth - imageViewWidth)/2, imageViewTopView, imageViewWidth, imageViewHeight))
        
        self.addSubview(self.imageView)
        
        // 2.添加标签
        let labelWidth: CGFloat = 101
        let labelHeight: CGFloat = 16
        let labelTopView: CGFloat = 120
        
        self.label = UILabel(frame: CGRectMake((cellWidth - labelWidth)/2, labelTopView, labelWidth, labelHeight))
        self.label.textAlignment = .Center
        //        let size: CGFloat = 13
        //        self.label.font = UIFont.systemFontSize(size)
        self.addSubview(self.label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
