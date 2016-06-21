//
//  SLCylindricalDelegate.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/21.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLCylindricalDelegate.h"


@implementation SLCylindricalDelegate

- (void)dealloc
{
//    NSLog(@"dealloc +++++  SLCylindricalDelegate");

}
- (void)drawLayer:(CALayer*)layer inContext:(CGContextRef)context {
    
    if (self.cylindricalView.em >self.cylindricalView.close) {
        
        [self emGigerThanClose:context inLayer:layer];
    }
    else
    {
        [self emGigerSmallClose:context inLayer:layer];
        
    }
   
    
}
//开盘价大于收盘价
- (void)emGigerThanClose:(CGContextRef)context inLayer:(CALayer*)layer
{
    float marg = self.cylindricalView.coordinate.magnification;
    
    float max = [self.cylindricalView.coordinate.maxValue floatValue];
    
    
    CGContextSetRGBFillColor(context, 3.0f/255.f, 116.f/255.f, 33.f/255.f, 1); //方框的填充色
    CGContextFillRect(context, CGRectMake(SLLine_Clearance, (max-self.cylindricalView.currentVolum)*marg, layer.bounds.size.width-SLLine_Clearance*2, self.cylindricalView.currentVolum*marg)); //画一个方框
}
//开盘价小于收盘价
- (void)emGigerSmallClose:(CGContextRef)context inLayer:(CALayer*)layer
{
    float marg = self.cylindricalView.coordinate.magnification;
    
    float max = [self.cylindricalView.coordinate.maxValue floatValue];
    
    
    CGContextSetRGBFillColor(context, 169.0f/255.f, 13.f/255.f, 145.f/255.f, 1); //方框的填充色
    CGContextFillRect(context, CGRectMake(SLLine_Clearance, (max-self.cylindricalView.currentVolum)*marg, layer.bounds.size.width-SLLine_Clearance*2, self.cylindricalView.currentVolum*marg)); //画一个方框
    
}
@end
