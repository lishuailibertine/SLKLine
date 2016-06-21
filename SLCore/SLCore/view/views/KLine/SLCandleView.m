//
//  SLCandleView.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/8.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLCandleView.h"
#import "SLCandleDelegate.h"

@interface SLCandleView()
{
    SLCandleDelegate *_canleDelegate;
    
}
@end
@implementation SLCandleView

- (void)dealloc
{
    NSLog(@"dealloc+++SLCandleView");

}

- (void)updateDataInThisCandleView
{
    //自定义图层
    CALayer *layer=[[CALayer alloc]init];
    layer.bounds=self.bounds;
    layer.position=CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    _canleDelegate =[[SLCandleDelegate alloc] init];
    _canleDelegate.candleView =self;
    //设置图层代理
    layer.delegate=_canleDelegate;
    
    //添加图层到根图层
    [self.layer addSublayer:layer];
    
    //调用图层setNeedDisplay,否则代理方法不会被调用
    [layer setNeedsDisplay];

}
@end
