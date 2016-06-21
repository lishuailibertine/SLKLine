//
//  SLDataHandleCenter.h
//  练习core
//
//  Created by 黄亚萍 on 16/6/16.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLDataAssembly.h"

//这个类主要是拿着 SLDataAssembly 的各种算法来 封装成一个上层的api

@interface SLDataHandleCenter : NSObject

/**
 *  处理第一次 区域view坐标轴的一些数据
 *
 *  @param obj         原始数据
 *  @param resultBlock 返回值
 */
+ (void)handleDataByAssessmbly:(id)obj resultBlock:(void(^)(id obj,...))resultBlock;

/**
 *  获取收盘价平均值的数组
 *
 *  @param obj         收盘价数组
 *  @param maType      MA类型
 *  @param resultBlock 返回值
 */
+ (void)handleAverageData:(id)obj type:(SLMaType)maType resultBlock:(void(^)(id obj,...))resultBlock;


/**
 *  获取所有收盘价数组
 *
 *  @param obj         原始数据
 *  @param resultBlock 返回收盘价数组
 */

+ (void)getAllCloseArry:(id)obj resultBlock:(void(^)(id obj,...))resultBlock;

@end
