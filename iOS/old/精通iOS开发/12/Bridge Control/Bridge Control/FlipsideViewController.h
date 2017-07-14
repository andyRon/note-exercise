//
//  FlipsideViewController.h
//  Bridge Control
//
//  Created by andyron on 16/2/22.
//  Copyright © 2016年 andyron. All rights reserved.
//


#import <UIKit/UIKit.h>
@class FlipsideViewController;
//构造一个翻转视图控制器代理协议，功能是翻转视图完成以后通知父视图
@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController
//对实现翻转视图控制器代理协议对象的应用属性
@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;

//导航栏中Done按钮的操作方法
- (IBAction)done:(id)sender;
@end