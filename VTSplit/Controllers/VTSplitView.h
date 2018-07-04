//
//  VTSplitView.h
//  VTSplit
//
//  Created by vtears on 2018/7/3.
//  Copyright © 2018年 vtears.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VTSplitView : UIView

@property (nonatomic, strong) UIView *masterView;
@property (nonatomic, strong) UIView *detailView;

@property (nonatomic) CGSize masterSize;
@property (nonatomic) CGSize detailSize;

@end
