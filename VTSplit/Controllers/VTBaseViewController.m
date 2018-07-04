//
//  VTBaseViewController.m
//  VTSplit
//
//  Created by vtears on 2018/7/3.
//  Copyright © 2018年 vtears.com. All rights reserved.
//

#import "VTBaseViewController.h"

#import "VTSplitViewController.h"

@interface VTBaseViewController ()

@end

@implementation VTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter
- (VTSplitViewController *)splitVC
{
    UIViewController *vc = self;
    do {
        if ([vc isKindOfClass:[VTSplitViewController class]]) {
            return (VTSplitViewController *)vc;
        }
        vc = vc.parentViewController;
    } while (vc != nil);
    
    return nil;
}

@end
