//
//  Note.m
//  MyNotes
//
//  Created by andyron on 2016/12/20.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "Note.h"

@implementation Note

-(instancetype)initWithDate:(NSDate *)date content:(NSString *)content {
    self = [super init];
    
    if (self) {
        self.date = date;
        self.content = content;
    }
    return self;
}

-(instancetype)init {
    self = [super init];
    
    if (self) {
        self.date = [[NSDate alloc] init];
        self.content = @"";
    }
    return self;
}
@end
