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

//scrollView call back
@property (nonatomic) BOOL touching;
@property (nonatomic) CGFloat offsetY;


@property (nonatomic, assign) CGFloat offsetHeight; // default is 20
@property (nonatomic, assign) CGFloat parallaxHeight; // default is 170

@property (nonatomic, copy) void(^handleRefreshEvent)(void);

- (void)stopRefresh;

// background
- (void)setBackgroundImage:(UIImage *)backgroundImage;
- (void)setBackgroundURL:(NSURL *)url;

// avatar
- (void)setAvatarImage:(UIImage *)backgroundImage;
- (void)setAvatarURL:(NSURL *)url;

// set info, Example : NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:@"Jack", @"userName", @"1990-10-19", @"birthday", nil];
- (void)setInfo:(NSDictionary *)info;

@end
