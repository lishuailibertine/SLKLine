//
//  SLRequestData.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/14.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLRequestData.h"
#import "ASIHTTPRequest.h"
#import "SLDataAssembly.h"

typedef void(^dataResult)(id,...);

@interface SLRequestData()

@property (nonatomic,copy)dataResult resultBlock;

@end
@implementation SLRequestData

- (void)getData:(NSString *)urlString reslur:(void(^)(id,...))reslutBlock;
{
    
    self.resultBlock = reslutBlock;
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request setTimeOutSeconds:5];
    [request setDelegate:self];
    [request startSynchronous];

}
- (void)requestFinished:(ASIHTTPRequest *)request
{

    NSString *content = [request responseString];
    NSArray *lines = [content componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];

    self.resultBlock(lines);
    
}
- (void)requestStarted:(ASIHTTPRequest *)request
{

}


- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"请求失败");

}
@end
