//
//  SLVolumView.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/21.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLVolumView.h"
#import "SLDataInit.h"

@interface SLVolumView()

@property(nonatomic,strong)id<VolumViewProtocol>VolumViewDelegate;

@end

@implementation SLVolumView

- (void)dealloc
{
    NSLog(@"dealloc SLVolumView");

}
- (void)setDrawVolumViewDelegate:(id<VolumViewProtocol>)VolumViewDelegate
{
    if (VolumViewDelegate!=nil) {
        
        _VolumViewDelegate = VolumViewDelegate;
         
    }
    if ([_VolumViewDelegate respondsToSelector:@selector(calculateVolumYCoordinate:view:resultBlock:)]) {
        [_VolumViewDelegate calculateVolumYCoordinate:[SLDataInit sharedDataInit].dataArry view:self resultBlock:nil];
    }

    if ([_VolumViewDelegate  respondsToSelector:@selector(drawCylindricalByCylindricalParamet:view:resultBlock:)]) {
        [_VolumViewDelegate drawCylindricalByCylindricalParamet:[SLDataInit sharedDataInit].dataArry view:self resultBlock:nil];
    }
}
@end
