//
//  NoteBL.h
//  MyNotes
//
//  Created by andyron on 2016/12/20.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

@interface NoteBL : NSObject

-(NSMutableArray*) createNote:(Note *)model;

-(NSMutableArray*) remove:(Note *)model;

-(NSMutableArray*) findAll;

@end
