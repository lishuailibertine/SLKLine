//
//  SLVolumView.h
//  练习core
//
//  Created by 黄亚萍 on 16/6/21.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLAearView.h"
#import "VolumViewProtocol.h"


@interface SLVolumView : SLAearView

- (void)setDrawVolumViewDelegate:(id<VolumViewProtocol>)VolumViewDelegate;

@end
