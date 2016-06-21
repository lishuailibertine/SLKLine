//
//  SLCandleView.h
//  练习core
//
//  Created by 黄亚萍 on 16/6/8.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLYCoordinate;

@interface SLCandleView : UIView

@property (nonatomic,assign)float emPrice;
@property (nonatomic,assign)float closePrice;
@property (nonatomic,assign)float highPrice;
@property (nonatomic,assign)float lowPrice;
@property (nonatomic,assign)float magnification;
@property (nonatomic,assign)float currentVolum;

@property (nonatomic,strong)SLYCoordinate * coordinate;//坐标

- (void)updateDataInThisCandleView;
@end
