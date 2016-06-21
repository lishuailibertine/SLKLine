//
//  SLAearViewGesture.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/20.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLAearViewGesture.h"
#import <UIKit/UIKit.h>
#import "SLKAearView.h"
#import "SLDataHandleCenter.h"
#import "SLDataInit.h"
#import "SLDataAssembly.h"

typedef void(^moveBlock)(id obj,NSArray * maArry,NSString * currentCrossY);

@interface SLAearViewGesture()

@property(nonatomic,weak)SLKAearView * aearView;
@property(nonatomic,strong)UIView * lineView;
@property(nonatomic,assign)float currentPointX; //当前手势移动的x
@property(nonatomic,assign)float currentPointY; //当前手势移动的y
@property(nonatomic,copy)moveBlock movingBlock; //手势移动的block


@end
@implementation SLAearViewGesture

- (void)dealloc
{
    NSLog(@"aearViewGesture  dealloc");

}
#pragma mark - 手势
#pragma mark -
- (void)addGestureAtView:(SLKAearView *)aearView movingCandleParameterBlock:(void(^)(id obj,NSArray * maArry,NSString * currentCrossY))movingCandleParameterBlock;
{

    self.movingBlock = movingCandleParameterBlock;
    
    self.aearView= aearView;
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(deleteFer:)];
    
    longPress.minimumPressDuration = 0.5;
    
    longPress.numberOfTouchesRequired = 1;
    
    _aearView.userInteractionEnabled = YES;
    
    [_aearView addGestureRecognizer:longPress];


}
- (void)deleteFer:(UIGestureRecognizer *)gesture
{
    __weak typeof(self) this =self;
    if (gesture.state ==UIGestureRecognizerStateBegan) {
//        NSLog(@"开始");
        CGPoint point  =[gesture locationInView:_aearView];
        
        
        [self drawCrossLineInSuperView:_aearView pointx:point.x pointy:point.y resultBlock:^(UIView * transverseline,UIView * verticalLine)
         {
             _aearView.transverse = transverseline;
             _aearView.vertical = verticalLine;
             
         }];
        
        [self drawYline:_aearView.ylineView pointx:point.x resultBlock:^(UIView * yLine){
        
            this.lineView = yLine;
        
        }];
        self.currentPointX = point.x ;  self.currentPointY = point.y;
        
        [self getCurrentSpecifiedCandleParameterBywhichCandle:[self calculateCurrentWhichCandleView:_currentPointX]];
    }
    
    if (gesture.state == UIGestureRecognizerStateChanged) {
//        NSLog(@"长按手势改变");
        
        CGPoint point  =[gesture locationInView:_aearView];
        
        _aearView.transverse.frame = CGRectMake(0, point.y, _aearView.bounds.size.width, 0.5);
        _aearView.vertical.frame = CGRectMake(point.x, 0, 0.5, _aearView.bounds.size.height);
        _lineView.frame = CGRectMake(point.x, 0, 0.5, _aearView.ylineView.bounds.size.height);
        
        self.currentPointX = point.x; self.currentPointY = point.y;
        [self getCurrentSpecifiedCandleParameterBywhichCandle:[self calculateCurrentWhichCandleView:_currentPointX]];
    }
    
    if (gesture.state==UIGestureRecognizerStateEnded) {
        
//        NSLog(@"结束");
        CGPoint point  =[gesture locationInView:_aearView];
        
        [_aearView.transverse removeFromSuperview];
        [_aearView.vertical removeFromSuperview];
        [_lineView  removeFromSuperview];
        self.currentPointX = point.x; self.currentPointY = point.y;
        
    }
}
#pragma mark - private
#pragma mark - 画十字线
//画十字线
- (void)drawCrossLineInSuperView:(UIView *)superView pointx:(float)pointx pointy:(float)pointy resultBlock:(void(^)(UIView *obj1,UIView *obj2))resultBlock
{
    UIView * transverseline = [[UIView alloc] initWithFrame:(CGRect){{0,pointy},{superView.bounds.size.width,0.5}}];
    transverseline.backgroundColor =[UIColor  redColor];
    
    UIView * verticalLine =[[UIView alloc] initWithFrame:(CGRect){{pointx,0},{0.5,superView.bounds.size.height}}];
    verticalLine.backgroundColor =[UIColor  redColor];
    
    [superView  addSubview:transverseline];
    [superView addSubview:verticalLine];
    
    resultBlock(transverseline,verticalLine);
    
}
//单化Y线
- (void)drawYline:(UIView *)superView pointx:(float)pointx resultBlock:(void(^)(UIView * yLine))resultBlock
{

    UIView * verticalLine =[[UIView alloc] initWithFrame:(CGRect){{pointx,0},{0.5,superView.bounds.size.height}}];
    verticalLine.backgroundColor =[UIColor  redColor];
    
    [superView addSubview:verticalLine];
    resultBlock(verticalLine);

}
#pragma mark-  计算当前手势到达的是第几个蜡烛   第几个蜡烛相对的第一个蜡烛不一定是最新日蜡烛
- (int)calculateCurrentWhichCandleView:(float)positionX
{

    float remainX = _aearView.insetWrite-positionX;
    
    if (remainX>=0) {
        
        float candleCount = remainX/SLCandleWidth;
        int integerCount = remainX/SLCandleWidth;
        
        if (candleCount>=integerCount) {
            
            int remainCandleCount =(int)ceilf(candleCount);
           
            return remainCandleCount;
            
        }
        
    }
    return 0;
}
#pragma mark-  获取十字架指定的蜡烛对应的一些参数 开盘 收盘 最高  最低

- (void)getCurrentSpecifiedCandleParameterBywhichCandle:(int)whichOne
{
    __weak typeof(self)this = self;
    
  [SLDataHandleCenter  handleDataByAssessmbly:[SLDataInit  sharedDataInit].dataArry resultBlock:^(id obj,...)
   {
       NSMutableArray * dataArry = (NSMutableArray *)obj;
       
       NSDictionary * dic = [dataArry objectAtIndex:whichOne];
 
       [SLDataHandleCenter getAllCloseArry:[SLDataInit  sharedDataInit].dataArry resultBlock:^(id obj,...)
        {
            NSMutableArray * closeArry = (NSMutableArray *)obj;
            
            [SLDataHandleCenter handleAverageData:closeArry type:ma5 resultBlock:^(id obj,...)
             {
                 NSMutableArray * ma5Arry = (NSMutableArray *)obj;
                 NSString * ma5Str =[ma5Arry objectAtIndex:whichOne];
                 
                 [SLDataHandleCenter handleAverageData:closeArry type:ma10 resultBlock:^(id obj,...)
                  {
                      NSMutableArray * ma10Arry = (NSMutableArray *)obj;
                      NSString * ma10Str =[ma10Arry objectAtIndex:whichOne];
                      [SLDataHandleCenter handleAverageData:closeArry type:ma20 resultBlock:^(id obj,...)
                       {
                           
                           NSMutableArray * ma20Arry = (NSMutableArray *)obj;
                           NSString * ma20Str =[ma20Arry objectAtIndex:whichOne];
                           
                           float yValue =this.currentPointY/this.aearView.coordinate.magnification;
                           
                           yValue = [this.aearView.coordinate.maxValue floatValue]-yValue;
                           
                           NSMutableArray * maArry =[NSMutableArray arrayWithObjects:ma5Str,ma10Str,ma20Str, nil];
                           
                           _movingBlock(dic,maArry,[NSString  stringWithFormat:@"%.2f",yValue]);
                           
                       }];
                      
                  }];
                 
             }];
            
            
        }];
   
   }];
    
    

}

@end
