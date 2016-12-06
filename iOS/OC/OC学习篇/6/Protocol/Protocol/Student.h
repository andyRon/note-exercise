//
//  Student.h
//  Protocol
//
//  Created by andyron on 2016/12/5.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ruleProtocol.h"

@interface Student : NSObject <ruleProtocol>
- (NSString *) goHome;

@end
