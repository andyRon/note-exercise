//
//  SingleComponentPickerViewController.m
//  7 Pickers
//
//  Created by andyron on 16/2/1.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "SingleComponentPickerViewController.h"

@interface SingleComponentPickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *singlePicker;

@property (strong, nonatomic) NSArray *characterNames;
@end

@implementation SingleComponentPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.characterNames = @[@"Luke", @"Leia", @"Han", @"Chewbacca", @"Artoo", @"Threepio", @"Lando"];
    NSLog(@"dict is %@",self.characterNames);
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
    NSInteger row = [self.singlePicker selectedRowInComponent:0];
    NSString *selected = self.characterNames[row];
    NSString *title = [[NSString alloc] initWithFormat:@"You selected %@!",  selected];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"Thank you for choosing." delegate:nil cancelButtonTitle:@"You're Welcome" otherButtonTitles:nil];
    [alert show];
    
}

# pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    NSLog(@"ab");
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.characterNames count];
}
# pragma mark Picker Delegate Methods 
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.characterNames[row];
}
@end
