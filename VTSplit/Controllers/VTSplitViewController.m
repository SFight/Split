//
//  VTSplitViewController.m
//  VTSplit
//
//  Created by vtears on 2018/7/3.
//  Copyright © 2018年 vtears.com. All rights reserved.
//

#import "VTSplitViewController.h"

#import "VTSplitView.h"

@interface VTSplitViewController ()

@property (nonatomic, strong) VTSplitView *splitView;

@end

@implementation VTSplitViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubviews];
    
    [self addChildViewController:self.masterViewController];
    [self addChildViewController:self.detailViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置视图
- (void)setupSubviews
{
    _splitView = [[VTSplitView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.splitView];
    
    self.splitView.masterSize = self.masterSize;
    self.splitView.detailSize = self.detailSize;
    
    [self.splitView.masterView addSubview:self.masterViewController.view];
    [self.splitView.detailView addSubview:self.detailViewController.view];
    
    [self.masterViewController.view setFrame:self.splitView.masterView.bounds];
    [self.detailViewController.view setFrame:self.splitView.detailView.bounds];
}

@end
