//
//  ViewController.m
//  3 Button Fun
//
//  Created by andyron on 16/1/5.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController


- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *plainText = [NSString stringWithFormat:@"%@ button pressed.", title];
//    _statusLabel.text = plainText;
    NSMutableAttributedString *styledText = [[NSMutableAttributedString alloc] initWithString:plainText];
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:_statusLabel.font.pointSize]};
    
    NSRange nameRange = [plainText rangeOfString:title];
    
    [styledText setAttributes:attributes range:nameRange];
    _statusLabel.attributedText = styledText;
    
    
}
@end
