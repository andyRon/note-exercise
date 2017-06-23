//
//  DatePickerViewController.m
//  7 Pickers
//
//  Created by andyron on 16/2/1.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDate *now = [NSDate date];
    [self.datePicker setDate:now animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)buttonPressed:(id)sender {
    NSDate *selected = [self.datePicker date];
    NSString *message = [[NSString alloc] initWithFormat:@"The date and time you selected is: %@", selected];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Date and Time Selected"
                          message:message
                          delegate:nil
                          cancelButtonTitle:@"That's is true!"
                          otherButtonTitles:nil ];
    [alert show];
}

@end
