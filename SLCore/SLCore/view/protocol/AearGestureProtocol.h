//
//  AearGestureProtocol.h
//  练习core
//
//  Created by 黄亚萍 on 16/6/20.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SLAearView;
@protocol AearGestureProtocol <NSObject>

/**
 *  KLineView上加手势  手势移动回调
 *
 *  @param aearView
 *  @param movingCandleParameterBlock
 */
- (void)addGestureAtView:(SLAearView *)aearView movingCandleParameterBlock:(void(^)(id obj,NSArray * maArry,NSString * currentCrossY))movingCandleParameterBlock;
@end
