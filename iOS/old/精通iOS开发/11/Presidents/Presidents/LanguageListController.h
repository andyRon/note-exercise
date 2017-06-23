//
//  LanguageListController.h
//  Presidents
//
//  Created by andyron on 16/2/18.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailViewController;

@interface LanguageListController : UITableViewController

@property (weak, nonatomic) DetailViewController *detailViewController;
@property (copy, nonatomic) NSArray *languageNames;
@property (copy, nonatomic) NSArray *languageCodes;

@end
