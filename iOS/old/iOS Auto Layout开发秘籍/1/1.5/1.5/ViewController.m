//
//  ViewController.m
//  1.5
//
//  Created by andyron on 26/09/2016.
//  Copyright © 2016 andyron. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 30.0f, 30.0f)];
    [self.view addSubview:view];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
//    [self.view addConstraint:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view(==80)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
//    [self.view addConstraint:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];

//    printf("%s", view);
//    NSLog(@"<%@:0x%0x>: %@", view.class.description, (int)view, view.hasAmbiguousLayout ? "Ambiguous" : "Unambiguous");
    
    UIView *view2 = [[TestView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 50.0f, 50.0f)];

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
