//
//  main.m
//  synchronized
//
//  Created by andyron on 2016/12/6.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}

void testSync() {
    NSObject* obj = [NSObject new];
    @synchronized (obj) {
    }
}
