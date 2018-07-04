//
//  MasterViewController.m
//  VTSplitTest
//
//  Created by vtears on 2018/7/3.
//  Copyright © 2018年 vtears.com. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

NSString *const kNotificationChangeRow = @"ChangeRow";

@interface MasterViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) NSInteger selectedRow;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onChangeRowNotificatoin:) name:kNotificationChangeRow object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = self.splitVC.detailViewController;
    if ([vc isKindOfClass:[DetailViewController class]]) {
        DetailViewController *detailVC = (DetailViewController *)vc;
        NSIndexPath *detailIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        [detailVC.tableView scrollToRowAtIndexPath:detailIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试%zi", indexPath.row];
//    if (indexPath.row == self.selectedRow) {
//        [cell setSelected:YES animated:YES];
//    }
//    cell.selected = indexPath.row == self.selectedRow ? YES : NO;
    
    return cell;
}

#pragma mark - NSNotification
- (void)onChangeRowNotificatoin:(NSNotification *)notification
{
    NSIndexPath *indexPath = notification.object;
    NSIndexPath *masterIndexPath = [NSIndexPath indexPathForRow:indexPath.section inSection:0];
    
    if (self.selectedRow == masterIndexPath.row) {
        // 当前已经选中，无需再做联动调整
        return;
    }
    
    self.selectedRow = masterIndexPath.row;
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:masterIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:masterIndexPath];
    cell.selected = YES;
}

@end
