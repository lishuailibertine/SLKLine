//
//  SLKAearView.h
//  练习core
//
//  Created by 黄亚萍 on 16/6/21.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLAearView.h"
#import "AearViewProtocol.h"
#import "AearGestureProtocol.h"

@protocol SLAearViewGestureMovingDelegate <NSObject>

- (void)aearViewGestureMoving:(id)candleParameter maArry:(NSArray *)maArry currentCrossY:(NSString *)crossYStr;


@end
@interface SLKAearView : SLAearView

@property (nonatomic,weak)id<SLAearViewGestureMovingDelegate>aearViewGestureMovingDelegate;

@property (nonatomic,strong)SLAearView * ylineView;//


@property(nonatomic,strong)UIView * transverse;
@property(nonatomic,strong)UIView * vertical;
//- (void)initYCoorData;
////更新蜡烛参数并划
//- (void)updataCylindricalView;

- (void)setAearViewDelegate:(id<AearViewProtocol>)aearViewDelegate;

/**
 *  在区域VIEW上添加手势
 */
- (void)setGestureRecognizers:(id<AearGestureProtocol>)aearGestureDelegate;
@end
