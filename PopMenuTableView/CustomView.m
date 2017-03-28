//
//  CustomView.m
//  IOS用CGContextRef画各种图形
//
//  Created by mc on 16/7/22.
//  Copyright © 2016年 mc. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //设置背景颜色
    [[UIColor clearColor]  set];
    UIRectFill([self bounds]);
    //拿到当前视图准备好的画板
    CGContextRef context = UIGraphicsGetCurrentContext();
    //利用path进行绘制三角形
    CGContextBeginPath(context);//标记
        CGContextMoveToPoint(context, self.bounds.size.width / 2, 0);//设置起点
    CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
    CGContextAddLineToPoint(context, 0, self.bounds.size.height);
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    [RGBColor(63, 70, 73, 1) setFill]; //设置填充色
    [[UIColor clearColor] setStroke]; //设置边框颜色
    CGContextDrawPath(context, kCGPathFillStroke);//绘制路径path
    
}

@end
