//
//  ViewController.m
//  Simple Table
//
//  Created by andyron on 16/2/15.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (copy, nonatomic) NSArray *dwarves;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dwarves = @[@"Sleepy d", @"Sneezy", @"Bashful", @"Happy", @"Doc", @"Grumpy", @"Dopey", @"Thorin",
                     @"Thorin", @"Dorin", @"Nori", @"Ori", @"Balin", @"Dwalin", @"Fili", @"Kili", @"Oin", @"Gloin", @"Bifur", @"Bofur", @"Bombur"];
    UITableView *tableView = (id)[self.view viewWithTag:1];
    UIEdgeInsets contentInset = tableView.contentInset;
    contentInset.top = 20;
    [tableView setContentInset:contentInset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dwarves count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle: UITableViewCellStyleDefault
//                initWithStyle:UITableViewCellStyleSubtitle
//                initWithStyle: UITableViewCellStyleValue1
//                initWithStyle: UITableViewCellStyleValue2
                
                reuseIdentifier:SimpleTableIdentifier];
    }
    // 在表视图单元中添加图片
    UIImage *image = [UIImage imageNamed:@"star"];
    cell.imageView.image = image;
    
    image = [UIImage imageNamed:@"lemon"];
    cell.imageView.highlightedImage = image;
    
    //添加详细文本标签
    if (indexPath.row < 7) {
        cell.detailTextLabel.text = @"Mr. Disney";
    } else {
        cell.detailTextLabel.text = @"Mr. Tolkien";
    }
    
    cell.textLabel.text = self.dwarves[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:50];
    return cell;
}
// 设置行缩进级别
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row;
}
// 在一行被点击但是高亮之前调用   返回即将被选中的行对应的索引
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return nil;
    } else {
        return indexPath;
    }
}
// 选中高亮后
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *rowValue = self.dwarves[indexPath.row];
    NSString *message = [[NSString alloc] initWithFormat:@"You selected %@", rowValue];
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Row Selected" message:message delegate:nil cancelButtonTitle:@"Yes, I did." otherButtonTitles:nil];
    [alert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//把所有行高设置成70
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
@end
