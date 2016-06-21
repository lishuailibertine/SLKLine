//
//  SLCylindricalView.h
//  练习core
//
//  Created by 黄亚萍 on 16/6/21.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SLYCoordinate.h"

@interface SLCylindricalView : UIView

@property (nonatomic,strong)SLYCoordinate * coordinate;//坐标
@property (nonatomic,assign)float em;
@property (nonatomic,assign)float close;
@property (nonatomic,assign)float currentVolum;

- (void)updateDataInThisCylindricalView;
@end
