//
//  TestView.m
//  1.5
//
//  Created by andyron on 26/09/2016.
//  Copyright © 2016 andyron. All rights reserved.
//

#import "TestView.h"

@implementation TestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void) testAmbiguity
{
    NSLog(@"<%@:0x%0x>: %@", self.class.description, (int)self, self.hasAmbiguousLayout ? "Ambiguous" : "Unambiguous");
    
//    for (UIView *view in self.subviews) {
//        [view testAmbiguity];
//    }
}

@end
