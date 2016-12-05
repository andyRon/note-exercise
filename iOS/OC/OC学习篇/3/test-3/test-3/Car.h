//
//  Car.h
//  test-3
//
//  Created by andyron on 2016/12/1.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject {
    @public float _capcity;
    
    NSString *_brand;
    NSString *_color;
    
    
}
//- (void)run: (float)t;

- (void)setBrand:(NSString *)brand;
- (void)setColor:(NSString *)color;
- (void)brake;
- (void)quicken;

@end
