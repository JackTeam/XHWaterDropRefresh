//
//  XHPathWaterDropRefreshHeadInfoView.h
//  XHWaterDropRefresh
//
//  Created by 曾 宪华 on 14-1-13.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const XHUserNameKey;
extern NSString *const XHBirthdayKey;

@interface XHPathWaterDropRefreshHeadInfoView : UIView

// parallax background
@property (nonatomic, strong) UIImageView *bannerImageView;
@property (nonatomic, strong) UIImageView *bannerImageViewWithImageEffects;

// user info
@property (nonatomic, strong) UIButton *avatarButton;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *birthdayLabel;


//scrollView call back
@property (nonatomic) BOOL touching;
@property (nonatomic) CGFloat offsetY;


@property (nonatomic, assign) CGFloat offsetHeight; // default is 20
@property (nonatomic, assign) CGFloat parallaxHeight; // default is 170

@property (nonatomic, copy) void(^handleRefreshEvent)(void);

- (void)stopRefresh;

// background image
- (void)setBackgroundImage:(UIImage *)backgroundImage;
// custom set url for subClass， There is not work
- (void)setBackgroundURL:(NSURL *)url;

// avatar image
- (void)setAvatarImage:(UIImage *)avatarImage;
// custom set url for subClass， There is not work
- (void)setAvatarURL:(NSURL *)url;

// set info, Example : NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:@"Jack", @"userName", @"1990-10-19", @"birthday", nil];
- (void)setInfo:(NSDictionary *)info;

@end
