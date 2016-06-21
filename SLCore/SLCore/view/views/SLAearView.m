//
//  SLAearView.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/10.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLAearView.h"

@interface SLAearView()



@end

@implementation SLAearView

- (void)dealloc
{
    NSLog(@"reallec  SLAearView++++++++++");

}
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.borderColor =@"0.8,0.1,0.8,1";
        self.dashLineCount = 4;
        self.dashLineColor =[UIColor whiteColor];
    }

    return self;

}

#pragma mark-
#pragma mark- setter getter
- (void)setBorderColor:(NSString *)borderColor
{
    if (borderColor!=nil) {

        _borderColor = borderColor;

    }

}

- (void)setDashLineCount:(int)dashLineCount
{
    if (dashLineCount!=0) {
        
        _dashLineCount = dashLineCount;
    }

}

- (void)setDashLineColor:(UIColor *)dashLineColor
{
    if (dashLineColor!=nil) {
        _dashLineColor = dashLineColor;
    }

}
#pragma mark- 需要被子类重写
#pragma mark- DrawRect
- (void)superDrawRect
{


}
#pragma mark-
#pragma mark-  drawRect
- (void)drawRect:(CGRect)rect 
{
    
    CGContextRef context = UIGraphicsGetCurrentContext(); //设置上下文
    
    NSArray * colorArry =[_borderColor componentsSeparatedByString:@","];
    
    CGContextSetLineWidth(context, 1.0);
    CGContextSetRGBStrokeColor(context, (CGFloat)[[colorArry objectAtIndex:0] floatValue], (CGFloat)[[colorArry objectAtIndex:1] floatValue],(CGFloat)[[colorArry objectAtIndex:2] floatValue], (CGFloat)[[colorArry objectAtIndex:3] floatValue]);// 矩形边框的颜色
    CGContextStrokeRect(context, CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height));//画方形边框, 参数2:方形的坐标。
    
    for (int i=0; i<_dashLineCount-1; i++) { //画了三条虚线
        
        CGFloat lengths[2] = {1,1};  //看笔记
        
        //    CGContextRef line = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context, self.dashLineColor.CGColor);
        
        
        CGContextSetLineDash(context, 0, lengths, 1);  //画虚线
        CGContextSetLineWidth(context, 1.0);
        CGContextMoveToPoint(context, 0.0, (self.bounds.size.height/self.dashLineCount)*(i+1));    //开始画线
        CGContextAddLineToPoint(context, self.bounds.size.width, (self.bounds.size.height/_dashLineCount)*(i+1));
        CGContextStrokePath(context);
        
    }
    [self  superDrawRect];
}

@end
