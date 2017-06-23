//
//  ViewController.m
//  Cells
//
//  Created by andyron on 16/2/16.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "ViewController.h"
#import "NameAndColorCell.h"

static NSString *CellTableIdentifier = @"CellTableIdentifier";

@interface ViewController ()

@property (copy, nonatomic) NSArray *computers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.computers = @[@{@"Name" : @"Macbook Air", @"Color" : @"Silver"},
                       @{@"Name" : @"Macbook Pro", @"Color" : @"Silver"},
                       @{@"Name" : @"iMac", @"Color" : @"Silver"},
                       @{@"Name" : @"Mac mini", @"Color" : @"Silver"},
                       @{@"Name" : @"Mac Pro", @"Color" : @"Black"},
                       ];
    
    UITableView *tableView = (id)[self.view viewWithTag:1];
//    [tableView registerClass:[NameAndColorCell class] forCellReuseIdentifier:CellTableIdentifier];
    tableView.rowHeight = 65; //表视图单元的高度
    UINib *nib = [UINib nibWithNibName:@"NameAndColorCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:CellTableIdentifier]; // 注册用nib表示表视图单元
    
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
    return [self.computers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NameAndColorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier forIndexPath:indexPath];
    NSDictionary *rowData = self.computers[indexPath.row];
    cell.name = rowData[@"Name"];
    cell.color = rowData[@"Color"];
    
    return cell;
}

@end
