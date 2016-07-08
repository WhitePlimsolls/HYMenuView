//
//  HYMenu.h
//  下拉菜单demo
//
//  Created by GZCP1897 on 16/6/3.
//  Copyright © 2016年 GZCP1897. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface HYMenu : NSObject

//小三角的属性相关
@property(nonatomic, assign)CGPoint triangleOrigin;//三角形的上面尖尖所在坐标 默认（20，64）
@property(nonatomic, assign)CGFloat triangleHeight;//小三角的高度 默认10
@property(nonatomic, strong)UIColor *triangleColor;//小三角颜色 默认白色

@property(nonatomic, assign)CGFloat tabEdgeLeft;//三角中心距离tabView左边间距 默认20

@property(nonatomic, assign)CGFloat tabWidth;//tab宽度 默认150
@property(nonatomic, assign)CGFloat tabHeight;//tab高度 默认220


@property(nonatomic, strong)UITableView *tab;

+ (instancetype)sharePopMenu;
- (void)show;
- (void)dimiss;
@end
