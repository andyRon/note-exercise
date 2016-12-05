//
//  Taxi.h
//  test-3
//
//  Created by andyron on 2016/12/1.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "Car.h"

@interface Taxi : Car {
    NSString *_company;
}
// 打印发票
- (void) printTrick;
@end
