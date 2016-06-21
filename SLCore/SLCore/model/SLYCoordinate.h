//
//  SLYCoordinate.h
//  练习core
//
//  Created by 黄亚萍 on 16/6/13.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLYCoordinate : NSObject

@property (nonatomic,strong)NSString * minValue;
@property (nonatomic,strong)NSString * maxValue;
@property (nonatomic,assign)float  diffValue;//每个格子相差的价格差;
@property (nonatomic,assign)float  magnification;//价格y值与像素y值的相差倍数; 注释:Y轴的最大与最小值之差越大倍数越小。

@end
