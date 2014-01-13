//
//  XHWaterDropRefresh.m
//  XHWaterDropRefresh
//
//  Created by 曾 宪华 on 14-1-13.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "XHWaterDropRefresh.h"

@interface XHWaterDropRefresh () {
    BOOL _isRefresh;
}

@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) CAShapeLayer *lineLayer;
@property (nonatomic, strong) UIImageView *refreshView;


@property (nonatomic, strong) NSTimer *timer;

@end

@implementation XHWaterDropRefresh

#pragma mark - Publish Api

- (void)startRefreshAnimation {
    
}

- (void)stopRefresh {
    
}

#pragma mark - Propertys

- (BOOL)isRefreshing {
    return _isRefresh;
}


#pragma mark - Life cycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self _setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self _setup];
    }
    return self;
}


- (void)_setup {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
