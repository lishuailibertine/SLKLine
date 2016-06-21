//
//  SLCommonFool.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/10.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLCommonFool.h"

@implementation SLCommonFool

+ (void)drawRectangular:(CGContextRef)context
{

    CGContextSetLineWidth(context, 3.0);
    CGContextSetRGBStrokeColor(context, 0.8, 0.1, 0.8, 1);
    CGContextStrokeRect(context, CGRectMake(5, 5, 300, 400));//画方形边框, 参数2:方形的坐标。


}

+ (void)bigerHigh:(NSArray *)arry result:(void(^)(float max,float min))resultBlock
{

    NSMutableArray * arryHigh =[NSMutableArray arrayWithCapacity:0];
     NSMutableArray * arryLow =[NSMutableArray arrayWithCapacity:0];
    
    for (int i=0; i<arry.count; i++) {
        
        NSDictionary * dic =[arry objectAtIndex:i];
        
        NSString * strHigh = [dic objectForKey:@"high"];
        NSString * strLow =[dic objectForKey:@"low"];
        [arryHigh addObject:strHigh];
        [arryLow addObject:strLow];
        
    }
    if (arry.count!=0&&arry!=nil) {
        
      
        float max =[SLCommonFool getMax:arryHigh]; float low =[SLCommonFool getMin:arryLow];
        
        resultBlock(max,low);

    
    }

}
+ (void)bigerVolum:(NSArray *)arry result:(void(^)(float max))resultBlock
{
   NSMutableArray * volumArry =[NSMutableArray arrayWithCapacity:0];

    for (int i=0; i<arry.count; i++) {
        
        NSDictionary * dic =[arry objectAtIndex:i];
        
        NSString * volumStr = [dic  objectForKey:@"volume"];
        [volumArry addObject:volumStr];
    }
    if (arry.count!=0&&arry!=nil) {
        
        float max =[SLCommonFool getMax:volumArry];
        
        resultBlock(max);
    }

}
+ (float)getMin:(NSArray *)arryHigh
{
   float minValue = [[arryHigh objectAtIndex:0] floatValue];
    for (int i= 0; i<arryHigh.count; i++) {
        
        NSString * nestStr =[arryHigh objectAtIndex:i];
        float nestValue =[nestStr floatValue];
        
        if (nestValue<=minValue) {
            
            minValue = nestValue;
        }
        
    }
    
    return minValue;

}
+ (float)getMax:(NSArray *)arryHigh
{
    float maxValue = [[arryHigh objectAtIndex:0] floatValue];
    for (int i= 0; i<arryHigh.count; i++) {
        
        NSString * nestStr =[arryHigh objectAtIndex:i];
        float nestValue =[nestStr floatValue];
 
        if (nestValue>=maxValue) {
            
            maxValue = nestValue;
        }
        
    }
    
    return maxValue;

}
//格式话小数 四舍五入类型
+ (NSString *) decimalwithFormat:(NSString *)format  floatV:(float)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setPositiveFormat:format];
    
    return  [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]];
}

@end
