//
//  ViewController.m
//  5 Restructure
//
//  Created by andyron on 16/1/28.
//  Copyright © 2016年 andyron. All rights reserved.
//
// 界面构建器不再对这个界面使用约束

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *actionButton1;
@property (weak, nonatomic) IBOutlet UIButton *actionButton2;
@property (weak, nonatomic) IBOutlet UIButton *actionButton3;
@property (weak, nonatomic) IBOutlet UIButton *actionButton4;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController

// 视图加载完成后（通常是从分镜或nib文件加载），做一些操作
- (void)viewDidLoad {
    [super viewDidLoad];

    // 确定视图加载时的屏幕方向
    UIApplication *app = [UIApplication sharedApplication];
    UIInterfaceOrientation currentOrientation = app.statusBarOrientation;
    [self doLayoutForOrientation:currentOrientation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 在旋转开始之后，最后的旋转动画发生之前自动调用
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [self doLayoutForOrientation:toInterfaceOrientation];
}
- (void)doLayoutForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        [self layoutPortrait];
    } else {
        [self layoutLandscape];
    }
}

static const CGFloat buttonHeight = 40;
static const CGFloat buttonWidth = 120;
static const CGFloat spacing = 20;

// 竖屏
- (void)layoutPortrait {
    CGRect b = self.view.bounds;
    
    // 矩形的宽和高
    CGFloat contentWidth = CGRectGetWidth(b) - (2*spacing);
    CGFloat contentHeight = CGRectGetHeight(b) - (4*spacing) - (2*buttonHeight);
    
    //绘出矩形
    self.contentView.frame = CGRectMake(spacing, spacing, contentWidth, contentHeight);
    
    // 两个点（用户标定四个按钮)
    CGFloat buttonRow1y = contentHeight + (2*spacing);
    CGFloat buttonRow2y = buttonRow1y + buttonHeight + spacing;
    
    CGFloat buttonCol1x = spacing;
    CGFloat buttonCol2x = CGRectGetWidth(b) - buttonWidth - spacing;
    
    //绘出四个按钮
    self.actionButton1.frame = CGRectMake(buttonCol1x, buttonRow1y, buttonWidth, buttonHeight);
    
    self.actionButton2.frame = CGRectMake(buttonCol2x, buttonRow1y, buttonWidth, buttonHeight);
    
    self.actionButton3.frame = CGRectMake(buttonCol1x, buttonRow2y, buttonWidth, buttonHeight);
    
    self.actionButton4.frame = CGRectMake(buttonCol2x, buttonRow2y, buttonWidth, buttonHeight);
    
    
}
// 横屏
- (void)layoutLandscape {
    CGRect b = self.view.bounds;
    
    CGFloat contentWidth = CGRectGetWidth(b) - buttonWidth - 3*spacing;
    CGFloat contentHeight = CGRectGetHeight(b) - 2*spacing;
    
    self.contentView.frame = CGRectMake(spacing, spacing, contentWidth, contentHeight);
    
    CGFloat buttonX = CGRectGetWidth(b) - spacing - buttonWidth;
    CGFloat buttonRow1y = spacing;
    CGFloat buttonRow4y = CGRectGetHeight(b) - spacing - buttonHeight;
    CGFloat buttonRow2y = buttonRow1y + floor((buttonRow4y-buttonRow1y)*0.333);// 按钮的上下间距不再是spacing
    CGFloat buttonRow3y = buttonRow1y + floor((buttonRow4y-buttonRow1y)*0.667);
    
    self.actionButton1.frame = CGRectMake(buttonX, buttonRow1y, buttonWidth, buttonHeight);
    self.actionButton2.frame = CGRectMake(buttonX, buttonRow2y, buttonWidth, buttonHeight);
    self.actionButton3.frame = CGRectMake(buttonX, buttonRow3y, buttonWidth, buttonHeight);
    self.actionButton4.frame = CGRectMake(buttonX, buttonRow4y, buttonWidth, buttonHeight);
    
    
}
@end
