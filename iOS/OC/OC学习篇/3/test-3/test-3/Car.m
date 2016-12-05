//
//  Car.m
//  test-3
//
//  Created by andyron on 2016/12/1.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)setBrand:(NSString *)brand{
    _brand = brand;
}
- (void)setColor:(NSString *)color{
    _color = color;
}
- (void)brake{
    NSLog(@"刹车");
}
- (void)quicken{
    NSLog(@"加速");
}
@end
