//
//  VTSplitViewController.h
//  VTSplit
//
//  Created by vtears on 2018/7/3.
//  Copyright © 2018年 vtears.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VTSplitViewController : UIViewController

@property (nonatomic, strong) UIViewController *masterViewController;
@property (nonatomic, strong) UIViewController *detailViewController;

@property (nonatomic) CGSize masterSize;
@property (nonatomic) CGSize detailSize;

@end
