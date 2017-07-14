//
//  main.m
//  count
//
//  Created by andyron on 15/1/6.
//  Copyright (c) 2015年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int count = 10;
    
    NSLog(@"1 to %d.",count);
    for (int i = 1; i<=count; i++) {
        NSLog(@"%d",i);
    }
    
    return 0;
}
