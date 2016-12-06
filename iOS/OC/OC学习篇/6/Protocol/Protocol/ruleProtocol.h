//
//  ruleProtocol.h
//  Protocol
//
//  Created by andyron on 2016/12/5.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ruleProtocol <NSObject>

@required

- (void) finshWork;
- (void) NOLate;

@optional

- (void) wearNeat;

@end
