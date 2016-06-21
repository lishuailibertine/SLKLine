//
//  SLAearView.h
//  练习core
//
//  Created by 黄亚萍 on 16/6/10.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SLYCoordinate.h"

@interface SLAearView : UIView

@property (nonatomic,assign)float  insetWrite;// 整片蜡烛所占的区域与外层AearView之间的留白  /2

@property (nonatomic,strong)SLYCoordinate * coordinate; //坐标系
@property (nonatomic,copy)NSString  *borderColor; //区域边框的颜色
@property (nonatomic,assign)int   dashLineCount;//中间虚线的条数
@property (nonatomic,strong)UIColor  *dashLineColor;//中间虚线的颜色

- (void)superDrawRect;
@end
