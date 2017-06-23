//
//  Note.h
//  MyNotes
//
//  Created by andyron on 2016/12/20.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

@property(nonatomic, strong) NSDate* date;
@property(nonatomic, strong) NSString* content;

-(instancetype)initWithDate:(NSDate*) date content:(NSString*) content;

-(instancetype)init;
@end
