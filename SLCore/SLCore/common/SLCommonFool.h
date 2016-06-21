//
//  SLCommonFool.h
//  练习core
//
//  Created by 黄亚萍 on 16/6/10.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SLCommonFool : NSObject

/**
 *  绘制矩形
 *
 *  @param context 上下文
 */
+ (void)drawRectangular:(CGContextRef)context;

/**
 *  这个方法计算的是KLineView图对应的high与low的最高值，最低值
 *
 *  @param arry         第一次过滤的数据
 *  @param resultBlock  返回最大值最小值
 */

+ (void)bigerHigh:(NSArray *)arry result:(void(^)(float max,float min))resultBlock;

/**
 *  求成交量的最大值
 *
 *  @param arry        第一次过滤的数据结构
 *  @param resultBlock 返回最大值
 */
+ (void)bigerVolum:(NSArray *)arry result:(void(^)(float max))resultBlock;

//格式话小数 四舍五入类型
+ (NSString *) decimalwithFormat:(NSString *)format  floatV:(float)floatV;
@end
