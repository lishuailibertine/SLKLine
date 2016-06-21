//
//  SLDataAssembly.h
//  练习core
//
//  Created by 黄亚萍 on 16/6/15.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ma5=0,//
    ma10,//
    ma20//
    
} SLMaType;

@interface SLDataAssembly : NSObject

/**
 *  请求过来的数据进行第一次加工并组装成SLAearView可以用的数据
 *
 *  @param obj         参数
 *  @param resultBlock 组装完成返回的数据
 */
- (void)firstAtdataBreakupAndAssemb:(id )obj result:(void(^)(id obj,...))resultBlock;


/**
 *  根据哪种的ma来获取平均值数组
 *
 *  @param type        ma-type
 *  @param inObj       输入参数 close数组 
 *  @param resultBlock
 *
 *  @return
 */
- (void)getAverage:(SLMaType)type inObj:(id)inObj resultBlock:(void(^)(id,...))resultBlock;

/**
 *  获取所有的收盘价的数组
 *
 *  @param obj         原始数据
 *  @param resultBlock 返回收盘价的数组
 */
- (void)getCloseArry:(id )obj resultBlock:(void(^)(id obj,...))resultBlock;

@end
