//
//  HYMenu.h
//  下拉菜单demo
//
//  Created by GZCP1897 on 16/6/3.
//  Copyright © 2016年 GZCP1897. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HYCoverView;
@interface HYMenu : NSObject

//小三角的属性相关
@property(nonatomic, assign)CGPoint triangleOrigin;//三角形的上面尖尖所在坐标
@property(nonatomic, assign)CGFloat triangleHeight;//小三角的高度
@property(nonatomic, strong)UIColor *triangleColor;//小三角颜色


@property(nonatomic, assign)CGFloat tabEdgeLeft;//三角中心距离tabView左边间距

@property(nonatomic, assign)CGFloat tabWidth;//tab宽度
@property(nonatomic, assign)CGFloat tabHeight;//tab高度
@property(nonatomic, strong) UIColor *tabVBackgroundColor;//tabView的背景颜色
@property(nonatomic, weak)id<UITableViewDelegate> tabDelegate;//代理
@property(nonatomic, weak)id<UITableViewDataSource> tabDatasource;//数据

@property(nonatomic, weak)HYCoverView *cover;
@property(nonatomic, weak)UITableView *tab;

+ (instancetype)sharePopMenu;
- (void)show;
- (void)dimiss;
@end
