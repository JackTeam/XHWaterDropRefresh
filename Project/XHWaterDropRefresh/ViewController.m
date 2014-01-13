//
//  ViewController.m
//  XHWaterDropRefresh
//
//  Created by 曾 宪华 on 14-1-13.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "ViewController.h"
#import "XHPathWaterDropRefreshHeadInfoView.h"

@interface ViewController ()
@property (nonatomic, strong) XHPathWaterDropRefreshHeadInfoView *pathWaterDropRefreshHeadInfoView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"XHWaterDropRefresh";
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    
    _pathWaterDropRefreshHeadInfoView = [[XHPathWaterDropRefreshHeadInfoView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 200)];
    [_pathWaterDropRefreshHeadInfoView setBackgroundImage:[UIImage imageNamed:@"Background.jpg"]];
    [_pathWaterDropRefreshHeadInfoView setAvatarImage:[UIImage imageNamed:@"meicon.png"]];
    [_pathWaterDropRefreshHeadInfoView setInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Jack", XHUserNameKey, @"1990-10-19", XHBirthdayKey, nil]];
    
    self.tableView.tableHeaderView = self.pathWaterDropRefreshHeadInfoView;
    
    __weak ViewController *wself = self;
    [_pathWaterDropRefreshHeadInfoView setHandleRefreshEvent:^{
        double delayInSeconds = 4.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [wself.pathWaterDropRefreshHeadInfoView stopRefresh];
        });
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- scroll delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    _pathWaterDropRefreshHeadInfoView.offsetY = scrollView.contentOffset.y;
    NSString *asd = nil;

    CGFloat padding = 80.0;
    CGFloat mub = 1.15;
    if(scrollView.contentOffset.y < 0 && scrollView.contentOffset.y >= -padding) {
        float percent = (-scrollView.contentOffset.y / (padding * mub));
        _pathWaterDropRefreshHeadInfoView.bannerImageViewWithImageEffects.alpha = percent;
        
    } else if (scrollView.contentOffset.y <= -padding) {
        _pathWaterDropRefreshHeadInfoView.bannerImageViewWithImageEffects.alpha = padding / (padding * mub);
    } else if (scrollView.contentOffset.y > padding) {
        _pathWaterDropRefreshHeadInfoView.bannerImageViewWithImageEffects.alpha = 0;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    _pathWaterDropRefreshHeadInfoView.touching = NO;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if(decelerate == NO) {
        _pathWaterDropRefreshHeadInfoView.touching = NO;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _pathWaterDropRefreshHeadInfoView.touching = YES;
}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"XHWaterDropRefreshCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = @"XHWaterDropRefreshCell";
    
    return cell;
}

@end
