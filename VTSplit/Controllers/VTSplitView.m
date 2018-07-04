//
//  VTSplitView.m
//  VTSplit
//
//  Created by vtears on 2018/7/3.
//  Copyright © 2018年 vtears.com. All rights reserved.
//

#import "VTSplitView.h"

@interface VTSplitView()

@end

@implementation VTSplitView

#pragma mark - lazyInit
- (UIView *)masterView
{
    if (!_masterView) {
        CGRect frame = {CGPointZero, CGSizeEqualToSize(self.masterSize, CGSizeZero) ? CGSizeMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)) : self.masterSize};
        _masterView = [[UIView alloc] initWithFrame:frame];
    }
    
    return _masterView;
}

- (UIView *)detailView
{
    if (!_detailView) {
        CGRect frame = {CGPointMake(CGRectGetMaxX(self.masterView.frame), 0), CGSizeEqualToSize(self.detailSize, CGSizeZero) ? CGSizeMake(CGRectGetWidth(self.frame) - CGRectGetWidth(self.masterView.frame), CGRectGetHeight(self.frame)) : self.detailSize};
        _detailView = [[UIView alloc] initWithFrame:frame];
    }
    
    return _detailView;
}

#pragma mark - Override
- (void)layoutSubviews
{
    for (UIView *aView in [self subviews]) {
        [aView removeFromSuperview];
    }
    
    [self addSubview:self.masterView];
    [self addSubview:self.detailView];
    
}

#pragma mark - setter
- (void)setMasterSize:(CGSize)masterSize
{
    _masterSize = masterSize;
    
    CGRect frame = {CGPointZero, CGSizeEqualToSize(self.masterSize, CGSizeZero) ? CGSizeMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)) : self.masterSize};
    self.masterView.frame = frame;
}

- (void)setDetailSize:(CGSize)detailSize
{
    _detailSize = detailSize;
    
    CGRect frame = {CGPointMake(CGRectGetMaxX(self.masterView.frame), 0), CGSizeEqualToSize(self.detailSize, CGSizeZero) ? CGSizeMake(CGRectGetWidth(self.frame) - CGRectGetWidth(self.masterView.frame), CGRectGetHeight(self.frame)) : self.detailSize};
    self.detailView.frame = frame;
}

@end
