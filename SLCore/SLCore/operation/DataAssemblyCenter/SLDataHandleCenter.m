//
//  SLDataHandleCenter.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/16.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLDataHandleCenter.h"
#import "SLDataAssembly.h"

@implementation SLDataHandleCenter

+ (void)handleDataByAssessmbly:(id)obj resultBlock:(void(^)(id obj,...))resultBlock
{

    SLDataAssembly * assem = [[SLDataAssembly alloc] init];
    
    [assem  firstAtdataBreakupAndAssemb:obj result:^(id obj,...)
     {
     
         resultBlock(obj);
     
     
     }];
   
}

+ (void)handleAverageData:(id)obj type:(SLMaType)maType resultBlock:(void(^)(id obj,...))resultBlock
{
    SLDataAssembly * assem =[[SLDataAssembly alloc] init];
    
    [assem getAverage:maType inObj:obj resultBlock:^(id obj,...)
     {
     
         resultBlock(obj);
     
     
     }];

}

+ (void)getAllCloseArry:(id)obj resultBlock:(void(^)(id obj,...))resultBlock
{
    SLDataAssembly * assem = [[SLDataAssembly alloc] init];
    [assem getCloseArry:obj resultBlock:^(id obj,...)
     {
     
         resultBlock(obj);
     
     }];

}
@end
