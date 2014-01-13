//
//  XHTableViewHeadInfoView.m
//  XHWaterDropRefresh
//
//  Created by 曾 宪华 on 14-1-13.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "XHTableViewHeadInfoView.h"
#import "XHWaterDropRefresh.h"

@interface XHTableViewHeadInfoView () {
    BOOL touch1, touch2, hasStop;
    BOOL isrefreshed;
}

@property (nonatomic, strong) UIImageView *bannerImageView;
@property (nonatomic, strong) UIButton *avatarButton;
@property (nonatomic, strong) XHWaterDropRefresh *waterDropRefresh;
@property (nonatomic, strong) UIView *showView;

@end

@implementation XHTableViewHeadInfoView

#pragma mark - Publish Api

- (void)stopRefresh {
    
}

// background
- (void)setBackgroundImage:(UIImage *)backgroundImage {
    
}

- (void)setBackgroundURL:(NSURL *)url {
    
}

// avatar
- (void)setAvatarImage:(UIImage *)backgroundImage {
    
}

- (void)setAvatarURL:(NSURL *)url {
    
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
