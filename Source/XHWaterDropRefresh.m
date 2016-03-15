//
//  XHWaterDropRefresh.m
//  XHWaterDropRefresh
//
//  Created by 曾 宪华 on 14-1-13.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
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
