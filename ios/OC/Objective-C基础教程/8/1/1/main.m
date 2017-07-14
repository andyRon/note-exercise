//
//  main.m
//  1
//
//  Created by andyron on 16/2/4.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    
    NSRange range;
    range.location = 12;
    range.length = 5;
    
//    NSRange range2 = {12, 5};
//    
//    NSRange range3 = NSMakeRange(12, 5);
    
//    CGPoint
    NSString *height;
    height = [NSString stringWithFormat:@"%d, %d", 4, 3];
    
//    NSUInteger length = [height length];
    
//    printf("%d", length);
    
    NSString *thing = @"adfdf";
    NSString *thing2 = thing;
    NSString *thing3 = @"adfdf";
    
    if (thing == thing2) {
        NSLog(@"123");
    }
    if ([thing isEqualToString:thing]) {
        NSLog(@"456");
    }
    
//    if ([height isEqualToString:thing]) {
//        
//    } else {
//        NSLog(@"adf");
//    }
//    if (![height compare:thing]) {
//        NSLog(@"adcc");
//    }
    return 0;
}
