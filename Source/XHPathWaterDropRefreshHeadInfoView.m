//
//  XHPathWaterDropRefreshHeadInfoView.m
//  XHWaterDropRefresh
//
//  Created by 曾 宪华 on 14-1-13.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "XHPathWaterDropRefreshHeadInfoView.h"
#import "XHWaterDropRefresh.h"

NSString *const XHUserNameKey = @"XHUserName";
NSString *const XHBirthdayKey = @"XHBirthday";

@interface XHPathWaterDropRefreshHeadInfoView () {
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

@implementation XHPathWaterDropRefreshHeadInfoView


#pragma mark - Publish Api

// background
- (void)setBackgroundImage:(UIImage *)backgroundImage {
    if (backgroundImage) {
        _bannerImageView.image = backgroundImage;
    }
}

- (void)setBackgroundURL:(NSURL *)url {
    
}

// avatar
- (void)setAvatarImage:(UIImage *)avatarImage {
    if (avatarImage) {
        [_avatarButton setImage:avatarImage forState:UIControlStateNormal];
    }
}

- (void)setAvatarURL:(NSURL *)url {
    
}

// set info
- (void)setInfo:(NSDictionary *)info {
    NSString *userName = [info valueForKey:XHUserNameKey];
    if (userName) {
        self.userNameLabel.text = userName;
    }
    
    NSString *birthday = [info valueForKey:XHBirthdayKey];
    if (birthday) {
        self.birthdayLabel.text = birthday;
    }
}

#pragma mark - Propertys

- (void)setOffsetHeight:(CGFloat)offsetHeight {
    _offsetHeight = offsetHeight;
    self.waterDropRefresh.offsetHeight = _offsetHeight;
}

#pragma mark - Life cycle

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self _setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self _setup];
    }
    return self;
}

- (void)_setup {
    self.parallaxHeight = 170;
    self.offsetHeight = 20;
    
    _bannerView = [[UIView alloc] initWithFrame:self.bounds];
    _bannerView.clipsToBounds = YES;
    _bannerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -self.parallaxHeight, CGRectGetWidth(_bannerView.frame), CGRectGetHeight(_bannerView.frame) + self.parallaxHeight * 2)];
    _bannerImageView.contentMode = UIViewContentModeScaleToFill;
    [_bannerView addSubview:self.bannerImageView];
    [self addSubview:self.bannerView];
    
    CGFloat padding = 20;
    _showView = [[UIView alloc] initWithFrame:CGRectMake(0, padding, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) - padding * 2)];
    _showView.backgroundColor = [UIColor clearColor];
    
    _avatarButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 18, 66, 66)];
    
    _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(93, 18, 207, 34)];
    _userNameLabel.textColor = [UIColor whiteColor];
    _userNameLabel.backgroundColor = [UIColor blackColor];
    
    _birthdayLabel = [[UILabel alloc] initWithFrame:CGRectMake(93, 60, 207, 24)];
    _birthdayLabel.textColor = [UIColor whiteColor];
    _birthdayLabel.backgroundColor = [UIColor blackColor];
    
    [_showView addSubview:self.avatarButton];
    [_showView addSubview:self.userNameLabel];
    [_showView addSubview:self.birthdayLabel];
    
    [self addSubview:self.showView];
    
    CGFloat waterDropRefreshHeight = 100;
    _waterDropRefresh = [[XHWaterDropRefresh alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds) - waterDropRefreshHeight, 20, waterDropRefreshHeight)];
    _waterDropRefresh.offsetHeight = self.offsetHeight;
    [self addSubview:self.waterDropRefresh];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    if(newSuperview) {
        [self initWaterView];
    }
}

- (void)initWaterView {
    __weak XHPathWaterDropRefreshHeadInfoView *wself =self;
    [_waterDropRefresh setHandleRefreshEvent:^{
        [wself setIsRefreshed:YES];
        if(wself.handleRefreshEvent) {
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

- (void)setTouching:(BOOL)touching {
    if(touching) {
        if(hasStop) {
            [self resetTouch];
        }
        
        if(touch1) {
            touch2 = YES;
        } else if (touch2 == NO && _waterDropRefresh.isRefreshing == NO) {
            touch1 = YES;
        }
    } else if(_waterDropRefresh.isRefreshing == NO) {
        [self resetTouch];
    }
    _touching = touching;
}

- (void)resetTouch {
    touch1 = NO;
    touch2 = NO;
    hasStop = NO;
    isrefreshed = NO;
}

- (void)stopRefresh {
    [_waterDropRefresh stopRefresh];
    if(_touching == NO) {
        [self resetTouch];
    } else {
        hasStop = YES;
    }
}

- (void)setOffsetY:(CGFloat)y {
    _offsetY = y;
    CGRect frame = _showView.frame;
    if(y < 0) {
        if((_waterDropRefresh.isRefreshing) || hasStop) {
            if(touch1 && touch2 == NO) {
                frame.origin.y = self.offsetHeight + y;
                _showView.frame = frame;
            } else {
                if(frame.origin.y != self.offsetHeight) {
                    frame.origin.y = self.offsetHeight;
                    _showView.frame = frame;
                }
            }
        } else {
            frame.origin.y = self.offsetHeight + y;
            _showView.frame = frame;
        }
    } else {
        if(touch1 && _touching && isrefreshed) {
            touch2 = YES;
        }
        if(frame.origin.y != self.offsetHeight) {
            frame.origin.y = self.offsetHeight;
            _showView.frame = frame;
        }
    }
    if (hasStop == NO) {
        _waterDropRefresh.currentOffset = y;
    }
    
    UIView *bannerSuper = _bannerImageView.superview;
    CGRect bframe = bannerSuper.frame;
    if(y < 0) {
        bframe.origin.y = y;
        bframe.size.height = -y + bannerSuper.superview.frame.size.height;
        bannerSuper.frame = bframe;
        
        CGPoint center =  _bannerImageView.center;
        center.y = bannerSuper.frame.size.height / 2;
        _bannerImageView.center = center;
    } else {
        if(bframe.origin.y != 0) {
            bframe.origin.y = 0;
            bframe.size.height = bannerSuper.superview.frame.size.height;
            bannerSuper.frame = bframe;
        }
        if(y < bframe.size.height) {
            CGPoint center =  _bannerImageView.center;
            center.y = bannerSuper.frame.size.height/2 + 0.5 * y;
            _bannerImageView.center = center;
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
