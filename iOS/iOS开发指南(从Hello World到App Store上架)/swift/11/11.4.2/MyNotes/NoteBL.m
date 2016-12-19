//
//  NoteBL.m
//  MyNotes
//
//  Created by andyron on 2016/12/20.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "NoteBL.h"
#import "NoteDAO.h"

@implementation NoteBL
-(NSMutableArray*)createNote:(Note *)model {
    NoteDAO *dao = [NoteDAO sharedManager];
    [dao create:model];
    return [dao findAll];
}

-(NSMutableArray*)remove:(Note *)model {
    NoteDAO *dao = [NoteDAO sharedManager];
    [dao remove:model];
    return [dao findAll];
}

-(NSMutableArray*) findAll {
    NoteDAO *dao = [NoteDAO sharedManager];
    return [dao findAll];
}
@end
