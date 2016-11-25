//
//  Person.m
//  class
//
//  Created by andyron on 2016/11/24.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)initWithName:(NSString *)name withAge:(NSInteger) age {
    self = [super init];
    
    if (self != nil) {
        _name = name;
        _age = age;
    }
    
    return self;
}

- (void)showinfo {
    NSLog(@"name is %@ and age is %d", _name, _age);
}
@end
