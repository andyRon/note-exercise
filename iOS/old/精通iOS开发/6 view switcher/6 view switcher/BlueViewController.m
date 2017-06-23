//
//  BlueViewController.m
//  6 view switcher
//
//  Created by andyron on 16/1/29.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "BlueViewController.h"

@implementation BlueViewController

- (IBAction)blueButtonPressed {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Blue View Button Pressed" message:@"You pressed the button on the blue view" delegate:nil cancelButtonTitle:@"Yep, I did." otherButtonTitles:nil];
    [alert show];
}

@end
