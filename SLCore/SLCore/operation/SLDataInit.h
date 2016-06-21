//
//  SLDataInit.h
//  练习core
//
//  Created by 黄亚萍 on 16/6/13.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLDataInit : NSObject

@property (nonatomic,strong)NSArray * dataArry;//这个数组是原始数据

+ (SLDataInit *)sharedDataInit;

- (void)initDataFromNet:(NSString *)urlString  result:(void(^)(id obj,...))resultBlock;
@end
