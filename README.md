## English
XHWaterDropRefresh is a similar Path 's dropdown refresh component.       
Has the following functions:         
1、set the drop size/water droplets pull-apart distance/water droplets deformation length         
2、parallax effect in background         
3、in the parallax effect background inside display Avatar        


## 中文
XHWaterDropRefresh是一款类似Path's的下拉刷新的组件.       
具有以下功能：        
1、设置水滴大小  / 水滴拉断距离  / 水滴变形长度          
2、视觉差的背景图      
3、在视觉差背景嵌套头像控件      

## Ease to use
## 使用简单
English:Propertys for pathWaterDropRefreshHeadInfoView.      
中文:让pathWaterDropRefreshHeadInfoView为属性.       
``` objective-c   
    XHPathWaterDropRefreshHeadInfoView *pathWaterDropRefreshHeadInfoView = [[XHPathWaterDropRefreshHeadInfoView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 140)];
    [pathWaterDropRefreshHeadInfoView setBackgroundImage:[UIImage imageNamed:@"MenuBackground"]];
    [pathWaterDropRefreshHeadInfoView setAvatarImage:[UIImage imageNamed:@"meicon.png"]];
    [pathWaterDropRefreshHeadInfoView setInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Jack", XHUserNameKey, @"1990-10-19", XHBirthdayKey, nil]];
    self.tableView.tableHeaderView = pathWaterDropRefreshHeadInfoView;
    
    self.pathWaterDropRefreshHeadInfoView = pathWaterDropRefreshHeadInfoView;
    
    __weak ViewController *wself = self;
    [pathWaterDropRefreshHeadInfoView setHandleRefreshEvent:^{
        double delayInSeconds = 4.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [wself.pathWaterDropRefreshHeadInfoView stopRefresh];
        });
    }];
```
``` objective-c   
#pragma mark- scroll delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    _pathWaterDropRefreshHeadInfoView.offsetY = scrollView.contentOffset.y;
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

```



## License

中文:      XHMediaZoom 是在MIT协议下使用的，可以在LICENSE文件里面找到相关的使用协议信息.

English:   XHMediaZoom is acailable under the MIT license, see the LICENSE file for more information.
