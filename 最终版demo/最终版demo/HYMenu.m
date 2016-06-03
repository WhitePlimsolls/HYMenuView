//
//  HYMenu.m
//  下拉菜单demo
//
//  Created by GZCP1897 on 16/6/3.
//  Copyright © 2016年 GZCP1897. All rights reserved.
//

#import "HYMenu.h"
#import "HYCoverView.h"


#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
static HYMenu *_instance = nil;

@interface HYMenu()


@end

@implementation HYMenu

- (void)show{
    
    HYCoverView *cover = [self setUpCoverView];
    self.cover = cover;
    UITableView *tab = [self setUpTableView];
    cover.tab = tab;
    self.tab =tab;
    [cover addSubview:tab];
    [UIView animateWithDuration:0.3 animations:^{
        tab.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
    [[UIApplication sharedApplication].keyWindow addSubview:cover];

}

- (void)dimiss{
    [UIView animateWithDuration:0.15 animations:^{
        self.tab.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
    } completion:^(BOOL finished) {
        [self.cover removeFromSuperview];
    }];
}

//初始化默认
- (instancetype)init{
    self = [super init];
    if (self) {
        self.triangleHeight = 10;
        self.triangleOrigin = CGPointMake(10, 64);
        self.triangleColor = [UIColor whiteColor];
        self.tabWidth = 150;
        self.tabHeight = 220;
        self.tabVBackgroundColor = [UIColor whiteColor];
        self.tabEdgeLeft = 20;
    }
    return self;
}


- (UITableView *)setUpTableView{
    UITableView *tabV = [[UITableView alloc] init];
    tabV.backgroundColor = self.tabVBackgroundColor;
    
    tabV.layer.cornerRadius = 10.0f;//设置view的圆角
    
    //设置动画
    CGFloat per = (self.tabEdgeLeft - self.triangleHeight) / self.tabWidth;
    if (per < 0) {
        per = 0;
    }else if (per > 1){
        per = 1;
    }
    tabV.layer.anchorPoint = CGPointMake(per, 0.0);//先设置锚点  在设置frame
    CGFloat x = self.triangleOrigin.x - self.tabEdgeLeft;
    CGFloat y = self.triangleOrigin.y + self.triangleHeight;
    tabV.frame = CGRectMake(x, y, self.tabWidth, self.tabHeight);//设置frame
    tabV.transform = CGAffineTransformMakeScale(0.0001, 0.0001);//动画初始transform
    
    //设置tab分割线
    if ([tabV respondsToSelector:@selector(setSeparatorInset:)]) {
        [tabV setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([tabV respondsToSelector:@selector(setLayoutMargins:)]) {
        [tabV setLayoutMargins:UIEdgeInsetsZero];
    }
    tabV.delegate = self.tabDelegate;
    tabV.dataSource = self.tabDatasource;
    return tabV;
}

- (HYCoverView *)setUpCoverView{
    HYCoverView *cover = [[HYCoverView alloc] init];
    cover.backgroundColor = [UIColor clearColor];
  //cover容错处理
    if ((self.triangleOrigin.x != 0) || (self.triangleOrigin.y != 0)) {
        cover.triangleOrigin = self.triangleOrigin;
    }
    if (self.triangleHeight > 0) {
        cover.triangleHeight = self.triangleHeight;
    }
    if (self.triangleColor) {
        cover.triangleColor = self.triangleColor;
    }
    cover.frame = CGRectMake(0, 0, screenW, screenH);
    return cover;
}


#pragma mark - singleton
+ (instancetype)sharePopMenu{
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}



@end
