//
//  SLAearDraw.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/16.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLAearDraw.h"
#import "SLDataHandleCenter.h"
#import "SLKAearView.h"
#import "SLCandleView.h"
#import "SLYCoordinate.h"
#import "SLDataInit.h"
#import "SLCommonFool.h"

@implementation SLAearDraw

- (void)dealloc
{
    NSLog(@"reallec  SLAearDraw++++++++++");
    
}

- (void)drawCandleByCandleParamet:(id)obj view:(SLKAearView*)view resultBlock:(void(^)(id obj,...))resultBlock
{
  __weak typeof(view)aearView = view;
    
    NSMutableArray * dataArry = (NSMutableArray *)obj;

    [SLDataHandleCenter handleDataByAssessmbly:dataArry resultBlock:^(NSArray * dataArry,...)
     {
         
         //数组的数量等于显示在页面上的蜡烛数目
         
         for (int i=0; i<dataArry.count; i++) {
             
            //新增属性  insetWrite 因为手势需要用到
             aearView.insetWrite =aearView.bounds.size.width-(aearView.bounds.size.width-SLCandleWidth*SLNumCandle)/2;
             
             SLCandleView * myView =[[SLCandleView alloc] initWithFrame:CGRectMake(aearView.bounds.size.width-(aearView.bounds.size.width-SLCandleWidth*SLNumCandle)/2-SLCandleWidth*(i+1), 0, SLCandleWidth, SLKLineHigh)];//10 代表了k线的宽度
 
             NSDictionary * dicData =[dataArry objectAtIndex:i];
             
             myView.emPrice = [[dicData objectForKey:@"em"] floatValue];
             
             NSString * closeStr =[dicData objectForKey:@"close"];
             
             myView.closePrice =[closeStr floatValue];
             myView.highPrice =[[dicData objectForKey:@"high"] floatValue];
             myView.lowPrice =[[dicData objectForKey:@"low"] floatValue];
             myView.currentVolum =[[dicData objectForKey:@"volume"] floatValue];
             myView.magnification = aearView.coordinate.magnification;
             
             myView.coordinate = aearView.coordinate;

             [myView updateDataInThisCandleView];//更新k图上的数据:赋值
             [aearView addSubview:myView];
         }
         
         
     }];
    


}

- (void)drawAverageAverageLineBylineParamet:(SLMaType)maType color:(UIColor *)color view:(SLAearView *)view resultBlock:(void(^)(id obj,...))resultBlock
{
    __weak typeof(view)aearview = view;
    
    [self getAverageArry:[SLDataInit sharedDataInit].dataArry type:maType resultBlock:^(id obj,...)
     {
         NSMutableArray * averageArry = (NSMutableArray *)obj;
         
         float maxValue = [aearview.coordinate.maxValue floatValue];
         float mag = aearview.coordinate.magnification;
         
         float firstValue =[[averageArry objectAtIndex:0] floatValue];
         
         [color set];  //设置线条颜色
         
         UIBezierPath* aPath = [UIBezierPath bezierPath];
         aPath.lineWidth = 1.0;
         
         aPath.lineCapStyle = kCGLineCapRound;  //线条拐角
         aPath.lineJoinStyle = kCGLineCapRound;  //终点处理
         
         float candleX = aearview.bounds.size.width-(aearview.bounds.size.width-SLCandleWidth*SLNumCandle)/2-SLCandleWidth;
         float x = candleX+ SLCandleWidth/2;
         
         // Set the starting point of the shape.
         [aPath moveToPoint:CGPointMake(x, (maxValue-firstValue)*mag)];
         
         for (int i=0; i<averageArry.count; i++) {
             
             
             if (i==averageArry.count-1) {
                 break;
             }
             
             float nestCloseValue =[[averageArry objectAtIndex:i+1] floatValue];
             float nestValue = x-SLCandleWidth*(i+1);
             
             // Draw the lines
             [aPath addLineToPoint:CGPointMake(nestValue,(maxValue-nestCloseValue)*mag)];
             
         }
         
         [aPath stroke]; //Draws line 根据坐标点连线
         
     }];

}
- (void)calculateYCoordinate:(id)obj view:(SLAearView *)view resultBlock:(void(^)(id obj,...))resultBlock
{

     __weak typeof(view)aearView = view;
    
    [SLDataHandleCenter handleDataByAssessmbly:[SLDataInit sharedDataInit].dataArry resultBlock:^(id obj,...){
        
        //取最大值
        [SLCommonFool bigerHigh:(NSArray *)obj result:^(float maxValue,float minValue)
         {
             float minNumber = minValue-SLFloatPrice; float maxNumber = maxValue+SLFloatPrice;//这个要不要四舍五入都可以
             
             minNumber = roundf(minNumber*100.0)/100.0;
             
             float diffNumber = (maxNumber - minNumber)/4.0f; diffNumber =roundf( diffNumber* 100.0)/100.0;// change:这里面的4还需要设置可配置
             
             float numDiff =  diffNumber*4;//把间距的大小四舍五入
             
             float maxReall = numDiff+minNumber;
             
             maxReall =roundf( maxReall* 100.0)/100.0;
             
             aearView.coordinate =[[SLYCoordinate alloc] init];
             aearView.coordinate.maxValue = [NSString stringWithFormat:@"%.2f",maxReall];
             aearView.coordinate.minValue =[NSString stringWithFormat:@"%.2f",minNumber];
             aearView.coordinate.diffValue = diffNumber;
             aearView.coordinate.magnification =SLKLineHigh/(maxReall-minNumber);
             NSLog(@"放大的倍数%f",aearView.coordinate.magnification);
             NSLog(@"最大值%.2f最小值%.2f",[aearView.coordinate.maxValue floatValue],[aearView.coordinate.minValue floatValue]);
             
         }];
        
        
        
    }];
}
#pragma mark -
#pragma mark - private 根据原始数据获取收盘价的平均值数组
- (void)getAverageArry:(id)obj type:(SLMaType)maType resultBlock:(void(^)(id obj,...))resultBlock
{
    
    [SLDataHandleCenter getAllCloseArry:obj resultBlock:^(id obj,...)
     {
         
         [SLDataHandleCenter handleAverageData:obj type:maType resultBlock:^(id obj,...)
          {
              
              resultBlock(obj);
              
          }];
         
         
     }];
    
}

@end
