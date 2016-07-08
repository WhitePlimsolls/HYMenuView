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

@property(nonatomic, weak)HYCoverView *cover;
@end

@implementation HYMenu

- (void)show{
    //设置tab
    [self setUpTableView];
    
    //初始化cover
    HYCoverView *cover = [self setUpCoverView];

    self.cover = cover;
   
    [cover addSubview:self.tab];
    
    //将其添加keyWindow上(如果不想重写touchBegin 可以添加手势 但是cover不能添加tab为自控制器  把cover、tab按照顺序 分别添加到keyWindow)
    [[UIApplication sharedApplication].keyWindow addSubview:cover];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.tab.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
    
}

- (void)dimiss{
    [UIView animateWithDuration:0.3 animations:^{
        self.tab.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
    } completion:^(BOOL finished) {
        [self.tab removeFromSuperview];
        [self.cover removeFromSuperview];
        //销毁tab 否则有bug
        self.tab = nil;
    }];
    
}

- (void)setUpTableView{
    self.tab.layer.cornerRadius = 10.0f;//设置view的圆角
    
    //计算锚点容错
    CGFloat per = (self.tabEdgeLeft - self.triangleHeight) / self.tabWidth;
    if (per < 0) {
        per = 0;
    }else if (per > 1){
        per = 1;
    }
    self.tab.layer.anchorPoint = CGPointMake(per, 0.0);//先设置锚点  在设置frame
    CGFloat x = self.triangleOrigin.x - self.tabEdgeLeft;
    CGFloat y = self.triangleOrigin.y + self.triangleHeight;
    self.tab.frame = CGRectMake(x, y, self.tabWidth, self.tabHeight);//设置frame
    self.tab.transform = CGAffineTransformMakeScale(0.0001, 0.0001);//动画初始transform
    
    //设置tab分割线
    if ([self.tab respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tab setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tab respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tab setLayoutMargins:UIEdgeInsetsZero];
    }

}

- (HYCoverView *)setUpCoverView{
    HYCoverView *cover = [[HYCoverView alloc] init];
    cover.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    
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

#pragma mark - 懒加载

- (UITableView *)tab{
    if (nil == _tab) {
        _tab = [[UITableView alloc] init];
    }
    return _tab;
}

//初始化默认
- (instancetype)init{
    self = [super init];
    if (self) {
        self.triangleHeight = 10;
        self.triangleOrigin = CGPointMake(20, 64);
        self.triangleColor = [UIColor whiteColor];
        self.tabWidth = 150;
        self.tabHeight = 220;
        self.tabEdgeLeft = 20;
    }
    return self;
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
