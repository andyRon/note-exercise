//
//  ContentCell.m
//  DialogViewer
//
//  Created by andyron on 16/2/17.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "ContentCell.h"

@implementation ContentCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        self.label.opaque = NO;
        self.label.backgroundColor = [UIColor colorWithRed:0.8 green:0.9 blue:1.0 alpha:1.0];
        self.label.textColor = [UIColor blackColor];
        
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [[self class] defaultFont];
        [self.contentView addSubview:self.label];
        
    }
    return self;
}
+ (UIFont *)defaultFont
{
    return [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}
+ (CGSize)sizeForContentString:(NSString *)string
{
    CGSize maxSize = CGSizeMake(300, 1000);  //单词的最大尺寸
    
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];  // 自动换行
    
    NSDictionary *attributes = @{ NSFontAttributeName:[self defaultFont], NSParagraphStyleAttributeName:style};
    CGRect rect = [string boundingRectWithSize:maxSize
                                       options:opts
                                    attributes:attributes
                                       context:nil];  // 计算字符串所占屏幕尺寸
    return rect.size;
}
- (NSString *)text
{
    return self.label.text;
}
- (void)setText:(NSString *)text
{
    self.label.text = text;
    CGRect newLabelFrame = self.label.frame;
    CGRect newConentFrame = self.contentView.frame;
    CGSize textSize = [[self class] sizeForContentString:text];
    newLabelFrame.size = textSize;
    newConentFrame.size = textSize;
    self.label.frame = newLabelFrame;
    self.contentView.frame = newConentFrame;
    
}
@end
