//
//  ViewController.m
//  VTSplitTest
//
//  Created by vtears on 2018/7/3.
//  Copyright © 2018年 vtears.com. All rights reserved.
//

#import "ViewController.h"

#import <VTSplit/VTSplit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SEL
- (IBAction)onClickButton:(UIButton *)button
{
    UIStoryboard *masterStoryboard = [UIStoryboard storyboardWithName:@"Master" bundle:nil];
    UIStoryboard *detailStoryboard = [UIStoryboard storyboardWithName:@"Detail" bundle:nil];
    
    VTSplitViewController *splitVC = [[VTSplitViewController alloc] init];
    splitVC.masterSize = CGSizeMake(100, [[UIScreen mainScreen] bounds].size.height);
    splitVC.masterViewController = [masterStoryboard instantiateInitialViewController];
    splitVC.detailViewController = [detailStoryboard instantiateInitialViewController];
    
    [self presentViewController:splitVC animated:YES completion:nil];
}


@end
