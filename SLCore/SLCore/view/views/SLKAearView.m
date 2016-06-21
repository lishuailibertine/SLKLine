//
//  SLKAearView.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/21.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLKAearView.h"
#import "SLCandleView.h"
#import "SLCommonFool.h"
#import "SLDataInit.h"
#import "SLYCoordinate.h"
#import "SLDataHandleCenter.h"

@interface SLKAearView ()

@property(nonatomic,strong)id<AearViewProtocol>aearViewDelegate;
@property(nonatomic,strong)id<AearGestureProtocol>aearGestuteDelegate;
@end

@implementation SLKAearView

- (void)dealloc
{
    NSLog(@"dealloc++++SLKAearView");

}
#pragma mark-
#pragma mark- gesture
- (void)setGestureRecognizers:(id<AearGestureProtocol>)aearGestureDelegate
{
    if (aearGestureDelegate!=nil) {
        
        _aearGestuteDelegate = aearGestureDelegate;
        
    }
    
    __weak typeof(self)this =self;
    
    if ([_aearGestuteDelegate  respondsToSelector:@selector(addGestureAtView:movingCandleParameterBlock:)]) {
        
        [_aearGestuteDelegate  addGestureAtView:self movingCandleParameterBlock:^(id obj,NSArray * maArry,NSString * currentY){
            
            if ([this.aearViewGestureMovingDelegate respondsToSelector:@selector(aearViewGestureMoving:maArry:currentCrossY:)]) {
                
                [this.aearViewGestureMovingDelegate aearViewGestureMoving:obj maArry:maArry currentCrossY:currentY];
            }
            
        }];
    }
    
}
- (void)setAearViewDelegate:(id<AearViewProtocol>)aearViewDelegate
{
    if (aearViewDelegate!=nil) {
        
        _aearViewDelegate = aearViewDelegate;
    }
    /**
     *  这个方法主要是完成Y轴最小值与最大值的计算，还有像素与价格相差倍数的计算
     */
    {  //计算出来Y轴坐标系,主要是放大倍数
        if ([_aearViewDelegate respondsToSelector:@selector(calculateYCoordinate:view:resultBlock:)]) {
            
            [_aearViewDelegate  calculateYCoordinate:[SLDataInit sharedDataInit].dataArry view:self resultBlock:nil];
        }
        
    }
    { //蜡烛相关参数赋值
        if ([_aearViewDelegate  respondsToSelector:@selector(drawCandleByCandleParamet:view:resultBlock:)]) {
            
            [_aearViewDelegate drawCandleByCandleParamet:[SLDataInit sharedDataInit].dataArry view:self resultBlock:nil];
        }
        
    }
    
}
#pragma mark - 父类的方法
#pragma mark - 在上下文中绘制ma平均线
- (void)superDrawRect
{
    //这里需要注意先调用super; 目的是获取上下文对象
    
    [super superDrawRect];
    
    if ([_aearViewDelegate respondsToSelector:@selector(drawAverageAverageLineBylineParamet:color:view:resultBlock:)]) {
        
        [_aearViewDelegate drawAverageAverageLineBylineParamet:ma5 color:[UIColor whiteColor] view:self resultBlock:nil];
        [_aearViewDelegate drawAverageAverageLineBylineParamet:ma10 color:[UIColor redColor] view:self resultBlock:nil];
        [_aearViewDelegate drawAverageAverageLineBylineParamet:ma20 color:[UIColor yellowColor] view:self resultBlock:nil];
        
    }
    

}
@end
