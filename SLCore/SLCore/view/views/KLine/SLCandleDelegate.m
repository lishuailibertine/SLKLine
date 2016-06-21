//
//  SLCandleDelegate.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/10.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLCandleDelegate.h"
#import <UIKit/UIKit.h>
#import "SLYCoordinate.h"


@interface SLCandleDelegate()
{

}
@end

@implementation SLCandleDelegate

- (void)drawLayer:(CALayer*)layer inContext:(CGContextRef)context {
    
    
    if (self.candleView.emPrice>self.candleView.closePrice) {
        
        [self emGigerThanClose:context inLayer:layer];
    }
    else
    {
        [self emGigerSmallClose:context inLayer:layer];
    
    }
    
}
//开盘价大于收盘价
- (void)emGigerThanClose:(CGContextRef)context inLayer:(CALayer*)layer
{
    float marg = self.candleView.magnification;
    
    float max = [self.candleView.coordinate.maxValue floatValue];
    
    CGContextSetRGBFillColor(context, 3.0f/255.f, 116.f/255.f, 33.f/255.f, 1); //方框的填充色
    CGContextFillRect(context, CGRectMake(SLLine_Clearance, (max-self.candleView.emPrice)*marg, layer.bounds.size.width-SLLine_Clearance*2, (self.candleView.emPrice-self.candleView.closePrice)*marg)); //画一个方框
    
    
    CGContextBeginPath(context);
    //画线
    CGPoint aPoints[2];//坐标点
    aPoints[0] =CGPointMake(layer.bounds.size.width/2,(max-self.candleView.emPrice)*marg);//坐标1
    aPoints[1] =CGPointMake(layer.bounds.size.width/2, (max-self.candleView.highPrice)*marg);//坐标2
    //CGContextAddLines(CGContextRef c, const CGPoint points[],size_t count)
    //points[]坐标数组，和count大小
    CGContextSetLineWidth(context, 1.0);//线的宽度
     CGContextSetRGBStrokeColor(context, 3.0f/255.f, 116.f/255.f, 33.f/255.f, 1);
    CGContextAddLines(context, aPoints, 2);//添加线
    CGContextDrawPath(context, kCGPathStroke); //根据坐标绘制路径
    
   
    //画线
    CGPoint aPoints2[2];//坐标点
    aPoints2[0] =CGPointMake(layer.bounds.size.width/2,(max-self.candleView.closePrice)*marg);//坐标1
    aPoints2[1] =CGPointMake(layer.bounds.size.width/2, (max-self.candleView.lowPrice)*marg);//坐标2
    //CGContextAddLines(CGContextRef c, const CGPoint points[],size_t count)
    //points[]坐标数组，和count大小
     CGContextSetRGBStrokeColor(context, 3.0f/255.f, 116.f/255.f, 33.f/255.f, 1);

    CGContextSetLineWidth(context, 1.0);//线的宽度
    CGContextAddLines(context, aPoints2, 2);//添加线
    CGContextDrawPath(context, kCGPathStroke); //根据坐标绘制路径


    
}
//开盘价小于收盘价
- (void)emGigerSmallClose:(CGContextRef)context inLayer:(CALayer*)layer
{
    float marg = self.candleView.magnification;
    
    float max = [self.candleView.coordinate.maxValue floatValue];
    
    CGContextBeginPath(context);
    
    CGContextSetRGBFillColor(context, 169.0f/255.f, 13.f/255.f, 145.f/255.f, 1); //方框的填充色
    CGContextFillRect(context, CGRectMake(SLLine_Clearance, (max-self.candleView.closePrice)*marg, layer.bounds.size.width-SLLine_Clearance*2, (self.candleView.closePrice-self.candleView.emPrice)*marg)); //画一个方框
    
    
    //画线
    CGPoint aPoints[2];//坐标点
    aPoints[0] =CGPointMake(layer.bounds.size.width/2,(max-self.candleView.closePrice)*marg);//坐标1
    aPoints[1] =CGPointMake(layer.bounds.size.width/2, (max-self.candleView.highPrice)*marg);//坐标2
    //CGContextAddLines(CGContextRef c, const CGPoint points[],size_t count)
    //points[]坐标数组，和count大小
     CGContextSetRGBStrokeColor(context, 169.0f/255.f, 13.f/255.f, 145.f/255.f, 1);//设置颜色
    CGContextSetLineWidth(context, 1.0);//线的宽度
    CGContextAddLines(context, aPoints, 2);//添加线
    CGContextDrawPath(context, kCGPathStroke); //根据坐标绘制路径
    
    
    //画线
    CGPoint aPoints2[2];//坐标点
    aPoints2[0] =CGPointMake(layer.bounds.size.width/2,(max-self.candleView.emPrice)*marg);//坐标1
    aPoints2[1] =CGPointMake(layer.bounds.size.width/2, (max-self.candleView.lowPrice)*marg);//坐标2
    //CGContextAddLines(CGContextRef c, const CGPoint points[],size_t count)
    //points[]坐标数组，和count大小
     CGContextSetRGBStrokeColor(context, 169.0f/255.f, 13.f/255.f, 145.f/255.f, 1);
    CGContextSetLineWidth(context, 1.0);//线的宽度
    CGContextAddLines(context, aPoints2, 2);//添加线
    CGContextDrawPath(context, kCGPathStroke); //根据坐标绘制路径
    
    CGContextClosePath(context);
    
}
@end
