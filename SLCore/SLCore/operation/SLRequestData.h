//
//  SLRequestData.h
//  练习core
//
//  Created by 黄亚萍 on 16/6/14.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import <Foundation/Foundation.h>

//这个主要是发送请求的：可能是HTTP 可能是socket 
@interface SLRequestData : NSObject

//@property (nonatomic,copy)NSMutableArray * dataArry;

/**
 *  发送http请求用asihttp
 *
 *  @param urlString   传入的url字符串
 *  @param reslutBlock 
 */
- (void)getData:(NSString *)urlString reslur:(void(^)(id,...))reslutBlock;
@end
