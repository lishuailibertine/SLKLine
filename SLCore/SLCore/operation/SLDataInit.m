//
//  SLDataInit.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/13.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLDataInit.h"
#import "SLCommonFool.h"
#import "SLYCoordinate.h"
#import "SLRequestData.h"

@implementation SLDataInit

+ (SLDataInit *)sharedDataInit
{

    static SLDataInit *dataInit = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataInit = [[self alloc] init];
    });
    return dataInit;

}

- (void)initDataFromNet:(NSString *)urlString  result:(void(^)(id obj,...))resultBlock
{
    __weak typeof(self) this =self;
    
    SLRequestData * requestData =[[SLRequestData alloc] init];
    [requestData getData:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] reslur:^(NSArray *dataArry,...)
     {
     
         this.dataArry = dataArry;
//         resultBlock(@"1",@"2");
         
     }];

    
}

@end
