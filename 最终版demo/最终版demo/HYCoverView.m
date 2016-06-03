//
//  HYCoverView.m
//  最终版demo
//
//  Created by GZCP1897 on 16/6/3.
//  Copyright © 2016年 GZCP1897. All rights reserved.
//

#import "HYCoverView.h"

@implementation HYCoverView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.3 animations:^{
        self.tab.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
    } completion:^(BOOL finished) {
        [self.tab removeFromSuperview];
        [self removeFromSuperview];
    }];  
}

//画小三角（等腰直角）
- (void)drawRect:(CGRect)rect {
    // 设置背景色
    [[UIColor whiteColor] set];
    
    //拿到当前视图准备好的画板
    CGContextRef  context = UIGraphicsGetCurrentContext();
    
    //利用path进行绘制三角形
    CGContextBeginPath(context);//标记
    
    //设置起点
    CGContextMoveToPoint(context,
                         self.triangleOrigin.x, self.triangleOrigin.y);
    
    CGContextAddLineToPoint(context, self.triangleOrigin.x - self.triangleHeight, self.triangleOrigin.y + self.triangleHeight);
    
    CGContextAddLineToPoint(context, self.triangleOrigin.x + self.triangleHeight, self.triangleOrigin.y + self.triangleHeight);
    
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    
    [self.triangleColor setFill];  //设置填充色
    
    [self.triangleColor setStroke]; //设置边框颜色
    
    CGContextDrawPath(context, kCGPathFillStroke);//绘制路径path
}

@end
