//
//  ViewController.m
//  DialogViewer
//
//  Created by andyron on 16/2/17.
//  Copyright © 2016年 andyron. All rights reserved.
//

#import "ViewController.h"
#import "ContentCell.h"
#import "HeaderCell.h"

@interface ViewController ()
@property (copy, nonatomic) NSArray *sections;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.sections =
    @[
      @{ @"header" : @"First Witch",
         @"content" : @"Hey, when will the three of us meet up later?" },
      @{ @"header" : @"Second Witch",
         @"content" : @"When everything's straightened out." },
      @{ @"header" : @"Third Witch",
         @"content" : @"That'll be just before sunset." },
      @{ @"header" : @"First Witch",
         @"content" : @"Where?" },
      @{ @"header" : @"Second Witch",
         @"content" : @"The dirt patch." },
      @{ @"header" : @"Third Witch",
         @"content" : @"I guess we'll see Mac there." },
      ];
    
    [self.collectionView registerClass:[ContentCell class] forCellWithReuseIdentifier:@"CONTENT"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    UIEdgeInsets contentInset = self.collectionView.contentInset;
    contentInset.top = 20;
    [self.collectionView setContentInset:contentInset];
    
    
    UICollectionViewLayout *layout = self.collectionView.collectionViewLayout;
    UICollectionViewFlowLayout *flow = (UICollectionViewFlowLayout *)layout;
    flow.sectionInset = UIEdgeInsetsMake(10, 20, 30, 20);
    
    
    [self.collectionView registerClass:[HeaderCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HEADER"];
    
    flow.headerReferenceSize = CGSizeMake(100, 25);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)wordsInSection:(NSInteger)section
{
    NSString *content = self.sections[section][@"content"];
    NSCharacterSet *space = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSArray *words = [content componentsSeparatedByCharactersInSet:space];
    return words;
}
// 告诉集合视图有多少分区
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.sections count];
}
// 每个分区有多少条目
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *words = [self wordsInSection:section];
    return [words count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *words = [self wordsInSection:indexPath.section];
    
    ContentCell *cell = [self.collectionView
                         dequeueReusableCellWithReuseIdentifier:@"CONTENT"
                         forIndexPath:indexPath];
    cell.text = words[indexPath.row];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *words = [self wordsInSection:indexPath.section];
    CGSize size = [ContentCell sizeForContentString:words[indexPath.row]];
    return size;
}
// 为每一分区提供一个标题
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqual:UICollectionElementKindSectionHeader]) {
        HeaderCell *cell = [self.collectionView
                            dequeueReusableSupplementaryViewOfKind:kind
                            withReuseIdentifier:@"HEADER"
                            forIndexPath:indexPath
                            ];
        cell.text = self.sections[indexPath.section][@"header"];
        return cell;
    }
    return nil;
}


@end
