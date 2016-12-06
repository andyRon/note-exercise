//
//  AppDelegate.m
//  test-3
//
//  Created by andyron on 2016/12/1.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "AppDelegate.h"
#import "Car.h"
#import "Taxi.h"
#import "WhitePrinter.h"
#import "BlackPrinter.h"
#import "Person.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

//    NSLog(@"%@", [Car init]);
    
//    [[Taxi alloc] printTrick];
    Person *person = [[Person alloc] init];
    
    WhitePrinter *whitePrinter = [[WhitePrinter alloc] init];
    BlackPrinter *blackPrinter = [[BlackPrinter alloc] init];
    
    [person doPrinter:whitePrinter];
    
    [person doPrinter:blackPrinter];
    

    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
