//
//  Taxi.m
//  test-3
//
//  Created by andyron on 2016/12/1.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "Taxi.h"

@implementation Taxi

- (void)printTrick {
    [super brake];
    [self brake];
    
    NSLog(@"出租车打印发票，公司是%@,品牌是%@,颜色是%@。", _company, _brand, _color);
}
@end
