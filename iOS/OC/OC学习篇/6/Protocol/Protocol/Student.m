//
//  Student.m
//  Protocol
//
//  Created by andyron on 2016/12/5.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "Student.h"

@implementation Student

- (NSString *) goHome {
    NSLog(@"go home");
    return @"";
}

#pragma mark - ruleProtocol
- (void) NOLate {
#warning "待补充"
    NSLog(@"no late");
}
- (void) finshWork {
    NSLog(@"finsh work");
}

@end
