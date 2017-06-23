//
//  NoteDAO.m
//  MyNotes
//
//  Created by andyron on 2016/12/20.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "NoteDAO.h"

@implementation NoteDAO

static NoteDAO *sharedSingleton = nil;

+ (NoteDAO*)sharedManager {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedSingleton = [[self alloc] init];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        NSDate *date1 = [dateFormatter dateFromString:@"2016-12-20 01:48:57"];
        Note *note1 = [[Note alloc] initWithDate:date1 content:@"Welcome to MyNote"];
        
        NSDate *date2 = [dateFormatter dateFromString:@"2016-12-21 01:50:19"];
        Note *note2 = [[Note alloc] initWithDate:date2 content:@"欢迎使用MyNote。"];
        
        sharedSingleton.listData = [[NSMutableArray alloc] init];
        [sharedSingleton.listData addObject:note1];
        [sharedSingleton.listData addObject:note2];

    });
    return sharedSingleton;
}

-(int)create:(Note *)model {
    [self.listData addObject:model];
    return 0;
}

-(int)remove:(Note *)model {
    for (Note *note in self.listData) {
        if ([note.date isEqualToDate:model.date]) {
            [self.listData removeObject:note];
        }
    }
    return 0;
}

-(int)modify:(Note *)model {
    for (Note *note in self.listData) {
        if ([note.date isEqualToDate:model.date]) {
            note.content = model.content;
            break;
        }
    }
    return 0;
}
- (NSMutableArray*) findAll {
    return self.listData;
}

-(Note *) findById:(Note *)model {
    for (Note *note in self.listData) {
        if ([note.date isEqualToDate:model.date]) {
            return note;
        }
    }
    return nil;
}



@end
