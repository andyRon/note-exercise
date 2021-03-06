//
//  main.m
//  FileWalker
//
//  Created by andyron on 2017/7/23.
//  Copyright © 2017年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSFileManager *manager;
        manager = [NSFileManager defaultManager];
        
        NSString *home;
        home = [@"~" stringByExpandingTildeInPath];
        
        NSDirectoryEnumerator *direnum;
        direnum = [manager enumeratorAtPath:home];
        
        NSMutableArray *files;
        files = [NSMutableArray arrayWithCapacity: 42];
        
        NSString *filename;
        while (filename = [direnum nextObject]) {
            if ([[filename pathExtension] isEqualToString:@"jpg"]) {
                [files addObject:filename];
            }
        }
        NSEnumerator *fileenum;
        fileenum = [files objectEnumerator];
        
        while (filename = [fileenum nextObject]) {
            NSLog(@"%@", filename);
        }
        
    }
    return 0;
}
