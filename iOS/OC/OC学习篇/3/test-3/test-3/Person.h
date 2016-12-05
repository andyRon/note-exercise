//
//  Person.h
//  test-3
//
//  Created by andyron on 2016/12/1.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Printer.h"

@interface Person : NSObject{
    NSString *_name;
}
- (void) doPrinter: (Printer *)printer;
@end
