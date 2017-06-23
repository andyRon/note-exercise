//
//  ContentCell.h
//  DialogViewer
//
//  Created by andyron on 16/2/17.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *label;
@property (copy, nonatomic) NSString *text;

+ (CGSize)sizeForContentString:(NSString *)s;

@end
