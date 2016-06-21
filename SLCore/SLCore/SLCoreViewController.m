//
//  SLCoreViewController.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/16.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLCoreViewController.h"
#import "SLTestViewController.h"

@implementation SLCoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"测试内存" forState:UIControlStateNormal];
    btn.frame =CGRectMake(100,100, 100, 100);
    btn.backgroundColor =[UIColor grayColor];
    [btn addTarget:self action:@selector(ok) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];


}

- (void)ok
{

    [self.navigationController pushViewController:[[SLTestViewController alloc] init] animated:YES];

}
@end
