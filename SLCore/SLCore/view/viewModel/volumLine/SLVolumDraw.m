//
//  SLVolumDraw.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/21.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLVolumDraw.h"
#import "SLDataHandleCenter.h"
#import "SLDataInit.h"
#import "SLCommonFool.h"
#import "SLYCoordinate.h"
#import "SLVolumView.h"
#import "SLCylindricalView.h"

@implementation SLVolumDraw

- (void)calculateVolumYCoordinate:(id)obj view:(SLVolumView *)view resultBlock:(void(^)(id obj,...))resultBlock
{
    
    __weak typeof(view)aearView = view;
    
    [SLDataHandleCenter handleDataByAssessmbly:[SLDataInit sharedDataInit].dataArry resultBlock:^(id obj,...){
        
        [SLCommonFool bigerVolum:(NSArray *)obj result:^(float max)
         {
             int maxValue = (int)max;  float reallMax = maxValue/1000000;
             
             reallMax =roundf( reallMax* 100.0)/100.0;
             
             aearView.coordinate =[[SLYCoordinate alloc] init];
             aearView.coordinate.maxValue = [NSString stringWithFormat:@"%.2f",reallMax];
             aearView.coordinate.minValue =[NSString stringWithFormat:@"%.2f",0.0f];
             aearView.coordinate.diffValue = reallMax/2;
             aearView.coordinate.magnification =SLKLineHigh/reallMax;
             NSLog(@"放大的倍数%f",aearView.coordinate.magnification);
             
         }];
        
        
    }];

}
- (void)drawCylindricalByCylindricalParamet:(id)obj view:(SLVolumView*)view resultBlock:(void(^)(id obj,...))resultBlock
{
    __weak typeof(view)aearView = view;
    
    NSMutableArray * dataArry = (NSMutableArray *)obj;
    
    [SLDataHandleCenter handleDataByAssessmbly:dataArry resultBlock:^(NSArray * dataArry,...)
     {
         
         //数组的数量等于显示在页面上的蜡烛数目
         
         for (int i=0; i<dataArry.count; i++) {
             
             //新增属性  insetWrite 因为手势需要用到
             aearView.insetWrite =aearView.bounds.size.width-(aearView.bounds.size.width-SLCandleWidth*SLNumCandle)/2;
             
             SLCylindricalView * myView =[[SLCylindricalView alloc] initWithFrame:CGRectMake(aearView.bounds.size.width-(aearView.bounds.size.width-SLCandleWidth*SLNumCandle)/2-SLCandleWidth*(i+1), 0, SLCandleWidth, SLKLineHigh)];//10 代表了k线的宽度
             
              NSDictionary * dicData =[dataArry objectAtIndex:i];
             
             myView.em = [[dicData objectForKey:@"em"] floatValue];
   
             myView.close =[[dicData objectForKey:@"close"] floatValue];

             myView.currentVolum =[[dicData objectForKey:@"volume"] floatValue]/1000000;
    
             myView.coordinate = aearView.coordinate;
             [myView updateDataInThisCylindricalView];//更新k图上的数据:赋值
             [aearView addSubview:myView];
         }
         
         
     }];
    
}
@end
