//
//  SLDataAssembly.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/15.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLDataAssembly.h"

@implementation SLDataAssembly

#pragma mark -
#pragma mark - 原始数据的第一次组装

- (void)firstAtdataBreakupAndAssemb:(id )obj result:(void(^)(id obj,...))resultBlock
{
    
    NSArray * lines = (NSArray *)obj;
    
      NSMutableArray * dataArry = [NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<lines.count; i++) {
        
        if (i==SLNumCandle+1) {
            break;
        }
        //date,open,high,low,close,volume,adj close;
        
        NSMutableDictionary * dic =[NSMutableDictionary dictionaryWithCapacity:0];
        
        NSString * strNum =[lines objectAtIndex:i];
        NSArray * numArry =[strNum componentsSeparatedByString:@","];
//        NSString * dateStr =[numArry objectAtIndex:0];//date
        NSString * emStr =[numArry objectAtIndex:1];//em
        NSString * highStr =[numArry objectAtIndex:2];//high
        NSString * lowStr =[numArry objectAtIndex:3];//low
        NSString * volumeStr =[numArry objectAtIndex:5];//volume
        NSString * closeStr =[numArry objectAtIndex:4];//close
//        NSString * adjCloseStr =[numArry objectAtIndex:6];//adj close
        
        [dic  setObject:emStr forKey:@"em"];
        [dic  setObject:closeStr forKey:@"close"];
        [dic setObject:highStr forKey:@"high"];
        [dic setObject:lowStr forKey:@"low"];
        [dic setObject:volumeStr forKey:@"volume"];
        if (i>=1) {  //把前面第一条数据过滤掉
            
            [dataArry addObject:dic];
        }
        
    }
    
    resultBlock(dataArry);

}
#pragma mark -
#pragma mark - 获取所有收盘价数组

- (void)getCloseArry:(id )obj resultBlock:(void(^)(id obj,...))resultBlock
{
    NSArray * lines = (NSArray *)obj;
    
    NSMutableArray * dataArry = [NSMutableArray arrayWithCapacity:0];
    
    for (int i =0; i<lines.count-1; i++) {
        
        if (i==0) {
            continue;
        }
        NSString * strNum =[lines objectAtIndex:i];
        NSArray * numArry = [strNum componentsSeparatedByString:@","];
        
        NSString * closeStr = [numArry objectAtIndex:4];
        
        [dataArry addObject:closeStr];
    }

    resultBlock(dataArry);
}
#pragma mark-
#pragma mark- 获取某种ma 对应的收盘价数组的平均值

- (void)getAverage:(SLMaType)type inObj:(id)inObj resultBlock:(void(^)(id,...))resultBlock
{
    int maValue =0;
    
    if (type==ma5) {
        
        maValue = 5;
    }
    if (type==ma10) {
        
        maValue = 10;
    }
    if (type==ma20) {
        
        maValue = 20;
    }
    
    [self calculateAverage:inObj intMaValue:maValue result:^(id obj,...)
     {
     
         resultBlock(obj);
     
     }];
    
}
/**
 *  计算MA 数据对应的平均值
 *
 *  @param obj 装着收盘价的数组
 *  @param maValue 哪种ma 5?10?20?
 *  @param resultBlock
 */

#pragma mark-
#pragma mark-   private
- (void)calculateAverage:(id )obj intMaValue:(int)maValue result:(void(^)(id obj,...))resultBlock
{
    
    NSArray * numArry = (NSArray *)obj;//装着收盘价的数组
    

    NSMutableArray * closeArry =[NSMutableArray arrayWithCapacity:0];
    
    for (int i=0; i<numArry.count; i++) {
    
        if (i==SLNumCandle+maValue-1) {
            
            break;
        }
        
        NSString * closeStr =[numArry objectAtIndex:i];
        [closeArry addObject:closeStr];
        
        
    }
    
    
//
//    for (int i=0; i<lines.count; i++) {
//        
//        if (i==0) {
//            continue;
//        }
//        if(i==SLNumCandle+maValue)
//        {
//            break;
//        }
//        
//        NSString * strNum =[lines objectAtIndex:i];
//        NSArray * numArry =[strNum componentsSeparatedByString:@","];
//        NSString * closeStr =[numArry objectAtIndex:4];//close
//        
//        [closeArry addObject:closeStr];
//    }
 //上面的执行是计算出显示的蜡烛的收盘价字符串数组
 //下面计算的是收盘价ma对应的平均值数组
    {  int s =maValue;
    
        NSMutableArray * maArry = [NSMutableArray arrayWithCapacity:0]; //初始化一个有五个元素的数组
//        NSMutableArray * ma10Arry = [NSMutableArray arrayWithCapacity:0];

    
        NSMutableArray * averageArry =[NSMutableArray arrayWithCapacity:0];
        
  
        for (int i =0; i<maValue; i++) {
            
            NSString * closeStr =[closeArry objectAtIndex:i];
            
            [maArry addObject:closeStr];
            
        }
        
        float  firstAverage = [self averageValue:maArry];
        
        [averageArry addObject:[NSString  stringWithFormat:@"%f",firstAverage]];
        
        while (true) {
           
            NSString * nestStr =[closeArry objectAtIndex:s];
            [maArry removeObjectAtIndex:0];
            [maArry addObject:nestStr];
            
            [averageArry addObject:[NSString stringWithFormat:@"%f",[self averageValue:maArry]]];
            s+=1;
            if (s==closeArry.count) {
                
                break;
            }
            
        }
       
    
        resultBlock(averageArry);
    }
    

}

- (float)averageValue:(NSMutableArray *)dataArry
{

    int count =(int) dataArry.count;
    
    float numValue =0;
    
    for (int i=0; i<count; i++) {
        
        float  value  = [[dataArry objectAtIndex:i] floatValue];
        
        numValue = value+numValue;
        //        numValue += value;

    }
    
    return numValue/count;

}

@end
