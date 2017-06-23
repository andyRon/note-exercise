//
//  main.m
//  OC-test
//
//  Created by andyron on 16/2/19.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arr = [[NSArray alloc] initWithObjects:@"computer", @"flowerpot",@"Router", nil];
        [arr writeToFile:@"/tmp/tmp.plist" atomically:YES ];
    }
    return 0;
}
