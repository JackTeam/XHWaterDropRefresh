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
@property (nonatomic, strong) UIView *bannerView;

@property (nonatomic, strong) UIButton *avatarButton;
@property (nonatomic, strong) UIView *showView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *birthdayLabel;

@property (nonatomic, strong) XHWaterDropRefresh *waterDropRefresh;


@end

@implementation XHTableViewHeadInfoView

#pragma mark - Publish Api

- (void)stopRefresh {
    
}

- (void)reloadData {
    
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

// set info
- (void)setInfo:(NSDictionary *)info {
    
}

#pragma mark - Propertys

- (void)setTableViewHeadInfoViewHeight:(CGFloat)tableViewHeadInfoViewHeight {
    _tableViewHeadInfoViewHeight = tableViewHeadInfoViewHeight;
    
    CGRect tableViewHeadInfoViewFrame = self.frame;
    tableViewHeadInfoViewFrame.size.height = _tableViewHeadInfoViewHeight;
    self.frame = tableViewHeadInfoViewFrame;
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
    _bannerView = [[UIView alloc] initWithFrame:CGRectZero];
    _bannerImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _bannerImageView.contentMode = UIViewContentModeScaleToFill;
    [_bannerView addSubview:self.bannerImageView];
    [self addSubview:self.bannerView];
    
    _showView = [[UIView alloc] initWithFrame:CGRectZero];
    _showView.backgroundColor = [UIColor clearColor];
    
    _avatarButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 18, 66, 66)];
    
    _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(93, 18, 207, 34)];
    
    _birthdayLabel = [[UILabel alloc] initWithFrame:CGRectMake(93, 60, 207, 24)];

    [_showView addSubview:self.userNameLabel];
    [_showView addSubview:self.birthdayLabel];
    
    [self addSubview:self.showView];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    if(newSuperview) {
        [self initWaterView];
    }
}

- (void)initWaterView {
    __weak XHTableViewHeadInfoView *wself =self;
    [_waterView setHandleRefreshEvent:^{
        [wself setIsRefreshed:YES];
        if(wself.handleRefreshEvent)
        {
            wself.handleRefreshEvent();
        }
    }];
}

- (void)setIsRefreshed:(BOOL)b {
    isrefreshed = b;
}

- (void)refresh {
    if(_waterDropRefresh.isRefreshing) {
        [_waterDropRefresh startRefreshAnimation];
    }
}

-(void)setTouching:(BOOL)touching
{
    if(touching)
    {
        if(hasStop)
        {
            [self resetTouch];
        }
        
        if(touch1)
        {
            touch2 = YES;
        }
        else if(touch2 == NO && _waterView.isRefreshing == NO)
        {
            touch1 = YES;
        }
    }
    else if(_waterView.isRefreshing == NO)
    {
        [self resetTouch];
    }
    _touching = touching;
}
-(void)resetTouch
{
    touch1 = NO;
    touch2 = NO;
    hasStop = NO;
    isrefreshed = NO;
}

- (void)stopRefresh {
    [_waterView stopRefresh];
    if(_touching == NO) {
        [self resetTouch];
    } else {
        hasStop = YES;
    }
}

- (void)setOffsetY:(float)y {
    _offsetY = y;
    CGRect frame = _showView.frame;
    if(y < 0) {
        if((_waterView.isRefreshing) || hasStop) {
            if(touch1 && touch2 == NO) {
                frame.origin.y = 20 + y;
                _showView.frame = frame;
            } else {
                if(frame.origin.y != 20)
                {
                    frame.origin.y = 20;
                    _showView.frame = frame;
                }
            }
        } else {
            frame.origin.y = 20+y;
            _showView.frame = frame;
        }
    } else {
        if(touch1 && _touching && isrefreshed) {
            touch2 = YES;
        }
        if(frame.origin.y != 20) {
            frame.origin.y = 20;
            _showView.frame = frame;
        }
    }
    if (hasStop == NO) {
        _waterView.currentOffset = y;
    }
    
    UIView* bannerSuper = _img_banner.superview;
    CGRect bframe = bannerSuper.frame;
    if(y < 0) {
        bframe.origin.y = y;
        bframe.size.height = -y + bannerSuper.superview.frame.size.height;
        bannerSuper.frame = bframe;
        
        CGPoint center =  _img_banner.center;
        center.y = bannerSuper.frame.size.height/2;
        _img_banner.center = center;
    } else {
        if(bframe.origin.y != 0) {
            bframe.origin.y = 0;
            bframe.size.height = bannerSuper.superview.frame.size.height;
            bannerSuper.frame = bframe;
        }
        if(y<bframe.size.height) {
            CGPoint center =  _img_banner.center;
            center.y = bannerSuper.frame.size.height/2 + 0.5*y;
            _img_banner.center = center;
        }
    }
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
