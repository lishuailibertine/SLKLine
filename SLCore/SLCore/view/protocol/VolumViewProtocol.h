//
//  VolumViewProtocol.h
//  练习core
//
//  Created by 黄亚萍 on 16/6/21.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SLVolumView;
@protocol VolumViewProtocol <NSObject>

/**
 *  根据原始数据计算出Y轴的最大值最小值，每一个格子的价格差，价格与像素之间放大的倍数等
 *
 *  @param obj
 *  @param view        区域view
 *  @param resultBlock 返回值
 */
- (void)calculateVolumYCoordinate:(id)obj view:(SLVolumView *)view resultBlock:(void(^)(id obj,...))resultBlock;

/**
 *  根据成交量圆柱的参数绘制圆柱
 *
 *  @param obj         原始数据
 *  @param view        volumView
 *  @param resultBlock 返回值
 */
- (void)drawCylindricalByCylindricalParamet:(id)obj view:(SLVolumView*)view resultBlock:(void(^)(id obj,...))resultBlock;

@end
