//
//  MasterViewController.h
//  Presidents
//
//  Created by andyron on 16/2/18.
//  Copyright © 2016年 andyron. All rights reserved.
// 分割视图左侧

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

