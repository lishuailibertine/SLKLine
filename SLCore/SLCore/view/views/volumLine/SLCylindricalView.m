//
//  SLCylindricalView.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/21.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLCylindricalView.h"
#import "SLCylindricalDelegate.h"
@interface SLCylindricalView()
{
  SLCylindricalDelegate * _cylindricalDelegate;

}
@end
@implementation SLCylindricalView

- (void)updateDataInThisCylindricalView
{
    //自定义图层
    CALayer *layer=[[CALayer alloc]init];
    layer.bounds=self.bounds;
    layer.position=CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    
    _cylindricalDelegate =[[SLCylindricalDelegate alloc] init];    //设置图层代理
    _cylindricalDelegate.cylindricalView =self;
    
    layer.delegate=_cylindricalDelegate;
    
    //添加图层到根图层
    [self.layer addSublayer:layer];
    
    //调用图层setNeedDisplay,否则代理方法不会被调用
    [layer setNeedsDisplay];

}
@end
