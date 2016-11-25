//
//  Person.h
//  class
//
//  Created by andyron on 2016/11/24.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    NSString *_name;
    NSInteger _age;
}

- (id)initWithName:(NSString *)name withAge:(NSInteger) age;

- (void)showinfo;

@end
