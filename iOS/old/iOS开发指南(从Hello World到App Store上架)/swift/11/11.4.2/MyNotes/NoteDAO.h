//
//  NoteDAO.h
//  MyNotes
//
//  Created by andyron on 2016/12/20.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

@interface NoteDAO : NSObject
@property (nonatomic, strong) NSMutableArray* listData;
+ (NoteDAO *) sharedManager;

- (int) create:(Note *)model;

- (int) remove:(Note *)model;

- (int) modify:(Note *)model;

- (NSMutableArray *) findAll;

- (Note *) findById:(Note *)model;
@end
