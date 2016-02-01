//
//  YellowViewController.m
//  6 view switcher
//
//  Created by andyron on 16/1/29.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "YellowViewController.h"

@implementation YellowViewController

- (IBAction)yellowButtonPressed {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Yellow View Button Pressed" message:@"You pressed the button on the blue view" delegate:nil cancelButtonTitle:@"Yep, I did." otherButtonTitles:nil];
    [alert show];
}
@end
