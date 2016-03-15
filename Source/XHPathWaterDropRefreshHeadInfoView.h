//
//  XHPathWaterDropRefreshHeadInfoView.h
//  XHWaterDropRefresh
//
//  Created by 曾 宪华 on 14-1-13.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
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
