//
//  NSString+Extension.m
//  category
//
//  Created by andyron on 2016/12/5.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (Boolean) validEmail {
    NSRange range = [self rangeOfString:@"@"];
    if (range.location == NSNotFound) {
        return false;
    } else {
        return true;
    }
}

- (NSInteger) intValue {
    NSLog(@"intValue");
    return 0;
}


@end
