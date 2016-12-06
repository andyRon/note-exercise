//
//  main.m
//  category
//
//  Created by andyron on 2016/12/5.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Extension.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        NSString *email = @"123123@qq.com";
        Boolean *isEmail = [email validEmail];
        if (isEmail) {
            NSLog(@"有效邮箱");
        } else {
            NSLog(@"无效邮箱");
        }
        
        //调用的是我们类目中的intValue方法
        NSInteger i = [email intValue];
        NSLog(@"intValue is %i",i);
        
        NSArray
    }
    return 0;
}
