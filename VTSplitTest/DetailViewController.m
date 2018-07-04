//
//  DetailViewController.m
//  VTSplitTest
//
//  Created by vtears on 2018/7/3.
//  Copyright © 2018年 vtears.com. All rights reserved.
//

#import "DetailViewController.h"

extern NSString *const kNotificationChangeRow;

@interface DetailViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, assign) NSInteger originY; // 添加此属性，用于判断向上还是向下

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect frame = [tableView rectForHeaderInSection:section];
    frame.origin = CGPointZero;
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"第%zi行", section];
    
    return label;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试%zi行%zi列", indexPath.section, indexPath.row];
    
    return cell;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll currentOffset:(%.2f,%.2f)", scrollView.contentOffset.x, scrollView.contentOffset.y);
    CGFloat offset = scrollView.contentOffset.y - self.originY; // offset大于0 向下移动，小于0 向上移动
    BOOL down = offset > 0 ? YES : NO;
    [self linkageNotificationUpOrDown:down];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"willBeginDragging currentOffset:(%.2f,%.2f)", scrollView.contentOffset.x, scrollView.contentOffset.y);
    self.originY = scrollView.contentOffset.y;
}

#pragma mark - 根据是向上还是向下滑动来展示当前的联动
- (void)linkageNotificationUpOrDown:(BOOL)upOrDown
{
    // upOrDown YES:down NO:up
    NSArray<NSIndexPath *> *indexPaths = [self.tableView indexPathsForVisibleRows];
    
//    NSIndexPath *first = [indexPaths firstObject];
//    NSIndexPath *last = [indexPaths lastObject];
//    NSIndexPath *indexPath = upOrDown ? first : first;
    
    NSIndexPath *indexPath = [indexPaths firstObject];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationChangeRow object:indexPath];
}


@end
