//
//  NameAndColorCell.m
//  Cells
//
//  Created by andyron on 16/2/16.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "NameAndColorCell.h"

// 类扩展
@interface NameAndColorCell ()

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *colorLabel;

@end

@implementation NameAndColorCell
//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    
//    if (self) {
//        // 创建四个UILabel
//        
//        CGRect nameLabelRect = CGRectMake(0, 5, 70, 15);
//        UILabel *nameMarker = [[UILabel alloc] initWithFrame:nameLabelRect];
//        nameMarker.textAlignment = NSTextAlignmentRight;
//        nameMarker.text = @"Name:";
//        nameMarker.font = [UIFont boldSystemFontOfSize:12];
//        [self.contentView addSubview:nameMarker];
//        
//        CGRect colorLabelRect = CGRectMake(0, 26, 70, 15);
//        UILabel *colorMarker = [[UILabel alloc] initWithFrame:colorLabelRect];
//        colorMarker.textAlignment = NSTextAlignmentRight;
//        colorMarker.text = @"Color:";
//        colorMarker.font = [UIFont boldSystemFontOfSize:12];
//        [self.contentView addSubview:colorMarker];
//        
//        CGRect nameValueRect = CGRectMake(80, 5, 200, 15);
//        _nameLabel = [[UILabel alloc] initWithFrame:nameValueRect];
//        [self.contentView addSubview:_nameLabel];
//        
//        CGRect colorValueRect = CGRectMake(80, 25, 200, 15);
//        _colorLabel = [[UILabel alloc] initWithFrame:colorValueRect];
//        [self.contentView addSubview:_colorLabel];
//        
//    }
//    return self;
//}

- (void)setName:(NSString *)n
{
    if (![n isEqualToString:_name]) {
        _name = [n copy];
        self.nameLabel.text = _name;
    }
}
- (void)setColor:(NSString *)c
{
    if (![c isEqualToString:_color]) {
        _color = [c copy];
        self.colorLabel.text = _color;
    }
}
@end






