//
//  AearViewProtocol.h
//  练习core
//
//  Created by 黄亚萍 on 16/6/16.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLDataAssembly.h"
#import <UIKit/UIKit.h>

@class SLAearView;
@protocol AearViewProtocol <NSObject>

@optional
/**
 *  drawRect  绘制区域
 */
//- (void)aearViewDrawRect:(CGContextRef)context view:(SLAearView*)view;
/**
 *  根据蜡烛参数绘制蜡烛view
 *
 *  @param obj         原始数据
 *  @param view        区域view
 *  @param resultBlock 返回值
 */
- (void)drawCandleByCandleParamet:(id)obj view:(SLAearView*)view resultBlock:(void(^)(id obj,...))resultBlock;

/**
 *  根据原始数据绘制收盘价平均值的折线图
 *
 *  @param maType      ma 类型  ma5 ma10 ma20
 *  @param color       线的颜色
 *  @param view        区域view
 *  @param resultBlock 返回值
 */
- (void)drawAverageAverageLineBylineParamet:(SLMaType)maType color:(UIColor *)color view:(SLAearView *)view resultBlock:(void(^)(id obj,...))resultBlock;
/**
 *  根据原始数据计算出Y轴的最大值最小值，每一个格子的价格差，价格与像素之间放大的倍数等
 *
 *  @param obj
 *  @param view        区域view
 *  @param resultBlock 返回值
 */
- (void)calculateYCoordinate:(id)obj view:(SLAearView *)view resultBlock:(void(^)(id obj,...))resultBlock;

@end
