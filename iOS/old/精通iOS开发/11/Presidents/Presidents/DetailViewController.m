//
//  DetailViewController.m
//  Presidents
//
//  Created by andyron on 16/2/18.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "DetailViewController.h"
#import "LanguageListController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
//        _detailItem = newDetailItem;
        _detailItem = modifyUrlForLanguage(newDetailItem, self.languageString);
        
        // Update the view.
        [self configureView];
    }
    
    // ??
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}

static NSString * modifyUrlForLanguage(NSString *url, NSString *lang) {
    if (!lang) {
        return url;
    }
    
    // 下面的代码很脆弱，因为它依赖于特定的维基百科的url
    NSRange codeRange = NSMakeRange(7, 2);
    if ([[url substringWithRange:codeRange] isEqualToString:lang]) {
        return url;
    } else {
        NSString *newUrl = [url stringByReplacingCharactersInRange:codeRange
                                                        withString:lang];
        return newUrl;
    }
}

- (void)configureView {
    NSURL *url = [NSURL URLWithString:self.detailItem];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
        NSLog(self.detailDescriptionLabel.text);
        
    }
//    NSLog(self.detailDescriptionLabel.text);
//    NSLog(@"12");
    
}

- (void)viewDidLoad {
//    NSLog(self.detailDescriptionLabel.text);
    [super viewDidLoad];
    
    self.languageButton =
    [[UIBarButtonItem alloc] initWithTitle:@"Choose Language"
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(toggleLanguagePopover)];
    self.navigationItem.rightBarButtonItem = self.languageButton;
    
    [self configureView];
}

- (void)toggleLanguagePopover
{
    if (self.languagePopoverController == nil) {
        LanguageListController *languageListController =
        [[LanguageListController alloc] init];
        languageListController.detailViewController = self;
        UIPopoverController *poc =
        [[UIPopoverController alloc]
         initWithContentViewController:languageListController];
        poc.delegate = self;
        [poc presentPopoverFromBarButtonItem:self.languageButton
                    permittedArrowDirections:UIPopoverArrowDirectionAny
                                    animated:YES];
        self.languagePopoverController = poc;
    } else {
        if (self.languagePopoverController != nil) {
            [self.languagePopoverController dismissPopoverAnimated:YES];
            self.languagePopoverController = nil;
        }
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
    if (popoverController == self.languagePopoverController) {
        self.languagePopoverController = nil;
    }
}


#pragma mark - Split view
// UISplitViewController的一个委托方法，iPad旋转到纵向时调用
- (void)splitViewController:(UISplitViewController *) splitController
     willHideViewController:(nonnull UIViewController *)ViewController
          withBarButtonItem:(nonnull UIBarButtonItem *)barButtonItem
       forPopoverController:(nonnull UIPopoverController *)popoverController
{
//    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    barButtonItem.title = NSLocalizedString(@"Presidents", @"Presidents");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}
- (void)splitViewController:(UISplitViewController *) splitController
     willShowViewController:(nonnull UIViewController *)ViewController
  invalidatingBarButtonItem:(nonnull UIBarButtonItem *)barButtonItem
{
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setLanguageString:(NSString *)newString {
    if (![newString isEqualToString:self.languageString]) {
        _languageString = [newString copy];
        self.detailItem = modifyUrlForLanguage(_detailItem, self.languageString);
    }
    if (self.languagePopoverController != nil) {
        [self.languagePopoverController dismissPopoverAnimated:YES];
        self.languagePopoverController = nil;
    }
}
@end
