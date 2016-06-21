//
//  SLTestViewController.m
//  练习core
//
//  Created by 黄亚萍 on 16/6/16.
//  Copyright (c) 2016年 hw. All rights reserved.
//

#import "SLTestViewController.h"
#import "SLDataInit.h"
#import "SLKAearView.h"
#import "SLAearDraw.h"
#import "SLAearViewGesture.h"
#import "SLVolumView.h"
#import "SLVolumDraw.h"

@interface SLTestViewController()<SLAearViewGestureMovingDelegate>

@property (nonatomic,strong)UILabel * ma5Label,*ma10Label,*ma20Label;


@property (nonatomic,strong)UILabel * emLabel,*closeLabel,*highLabel,*lowLabel;


@end
@implementation SLTestViewController

- (void)dealloc
{
    NSLog(@"释放testViewController");
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    NSString * idStr = @"宝钢股份（600019.SS）";
    idStr =[[idStr componentsSeparatedByString:@"（"][1] componentsSeparatedByString:@"）"][0];

    //    NSString * req_type =@"h";
    NSString * req_freq=@"m";
    NSString * req_url =@"http://ichart.yahoo.com/table.csv?s=%@&g=%@";
    
    SLDataInit * initData =[SLDataInit sharedDataInit];
    [initData initDataFromNet:[[NSString alloc] initWithFormat:req_url,idStr,req_freq] result:nil];
    
    SLKAearView * aearView =[[SLKAearView alloc] initWithFrame:(CGRect){{SLAearWrite,125},{self.view.bounds.size.width-SLAearWrite*2,SLKLineHigh}}];

    aearView.aearViewGestureMovingDelegate=self;
    
    [aearView   setGestureRecognizers:[[SLAearViewGesture alloc] init]];
    [aearView setAearViewDelegate:[[SLAearDraw alloc] init]];
    
    aearView.backgroundColor =[UIColor blackColor];
    
    
    SLVolumView * arerViewTwo =[[SLVolumView alloc] initWithFrame:(CGRect){{CGRectGetMinX(aearView.frame),CGRectGetMaxY(aearView.frame)+30},{aearView.bounds.size.width,aearView.bounds.size.height}}];
    
    [arerViewTwo setDrawVolumViewDelegate:[[SLVolumDraw alloc] init]];
    aearView.ylineView = arerViewTwo;
    arerViewTwo.dashLineCount =2;
    arerViewTwo.dashLineColor = [UIColor blueColor];
    arerViewTwo.backgroundColor =[UIColor blackColor];
    
    [self.view addSubview:aearView];
    [self.view addSubview:arerViewTwo];
    
    [self initUI:aearView];
}
#pragma mark - delegate
- (void)aearViewGestureMoving:(id)candleParameter maArry:(NSArray *)maArry currentCrossY:(NSString *)crossYStr
{
    NSMutableDictionary * candleDic = (NSMutableDictionary *)candleParameter;
    
    NSString * emStr =[candleDic objectForKey:@"em"]; NSString * closeStr =[candleDic objectForKey:@"close"];
    NSString * highStr =[candleDic objectForKey:@"high"]; NSString * lowStr =[candleDic objectForKey:@"low"];
    
    NSString * ma5Str =[maArry objectAtIndex:0]; NSString * ma10Str =[maArry objectAtIndex:1];
    NSString * ma20Str =[maArry objectAtIndex:2];
    ma5Str =[NSString stringWithFormat:@"%.2f",[ma5Str floatValue]]; ma10Str =[NSString stringWithFormat:@"%.2f",[ma10Str floatValue]];
    ma20Str = [NSString stringWithFormat:@"%.2f",[ma20Str floatValue]];
    
    
    [self replaceStrMaString:ma5Str ma10:ma10Str ma20:ma20Str em:emStr close:closeStr high:highStr low:lowStr];
}
#pragma mark - private
- (void)initUI:(SLAearView *)aearView
{

    UILabel *  ma0Laber =[[UILabel alloc] initWithFrame:(CGRect){{CGRectGetMinX(aearView.frame),CGRectGetMinY(aearView.frame)-20},{58,20}}];
    
    [self setLabelAttu:ma0Laber text:@"日线 MA5:" textColor:[UIColor blackColor]];
    
    UILabel *  ma5Laber =[[UILabel alloc] initWithFrame:(CGRect){{CGRectGetMaxX(ma0Laber.frame),CGRectGetMinY(ma0Laber.frame)},{40,20}}];
    self.ma5Label = ma5Laber;
    [self setLabelAttu:ma5Laber text:@"0.00" textColor:[UIColor blackColor]];
    
    UILabel *  ma1Laber =[[UILabel alloc] initWithFrame:(CGRect){{CGRectGetMaxX(ma5Laber.frame),CGRectGetMinY(ma5Laber.frame)},{40,20}}];
    
    [self setLabelAttu:ma1Laber text:@"MA10:" textColor:[UIColor  redColor]];
    
    UILabel *  ma10Laber =[[UILabel alloc] initWithFrame:(CGRect){{CGRectGetMaxX(ma1Laber.frame),CGRectGetMinY(ma1Laber.frame)},{40,20}}];
    self.ma10Label = ma10Laber;
    [self setLabelAttu:ma10Laber text:@"0.00" textColor:[UIColor  redColor]];
    
    UILabel *  ma2Laber =[[UILabel alloc] initWithFrame:(CGRect){{CGRectGetMaxX(ma10Laber.frame),CGRectGetMinY(ma10Laber.frame)},{40,20}}];
    
    [self setLabelAttu:ma2Laber text:@"MA20:" textColor:[UIColor greenColor]];
    
    
    UILabel *  ma20Laber =[[UILabel alloc] initWithFrame:(CGRect){{CGRectGetMaxX(ma2Laber.frame),CGRectGetMinY(ma2Laber.frame)},{40,20}}];
    self.ma20Label = ma20Laber;
    [self setLabelAttu:ma20Laber text:@"0.00" textColor:[UIColor greenColor]];
    
    UILabel * em0Label =[[UILabel alloc] initWithFrame:(CGRect){{CGRectGetMinX(aearView.frame),CGRectGetMinY(ma0Laber.frame)-20},{40,20}}];
    
    [self setLabelAttu:em0Label text:@"开盘价:" textColor:[UIColor  blackColor]];
    
    UILabel * emLabel =[[UILabel alloc] initWithFrame:(CGRect){{CGRectGetMaxX(em0Label.frame),CGRectGetMinY(em0Label.frame)},{40,20}}];
    [self setLabelAttu:emLabel text:@"0.00" textColor:[UIColor redColor]];
    self.emLabel = emLabel;
    
    UILabel * close0Label =[[UILabel alloc] initWithFrame:(CGRect){{CGRectGetMaxX(emLabel.frame),CGRectGetMinY(emLabel.frame)},{40,20}}];
    
    [self setLabelAttu:close0Label text:@"收盘价:" textColor:[UIColor  blackColor]];
    
    UILabel * closeLabel =[[UILabel alloc] initWithFrame:(CGRect){{CGRectGetMaxX(close0Label.frame),CGRectGetMinY(close0Label.frame)},{40,20}}];
    self.closeLabel = closeLabel;
    [self setLabelAttu:closeLabel text:@"0.00" textColor:[UIColor redColor]];
    
    
    UILabel * high0Label =[[UILabel alloc] initWithFrame:(CGRect){{CGRectGetMinX(em0Label.frame),CGRectGetMinY(em0Label.frame)-20},{40,20}}];
    
    [self setLabelAttu:high0Label text:@"最高价:" textColor:[UIColor  blackColor]];
    
    UILabel * highLabel =[[UILabel alloc] initWithFrame:(CGRect){{CGRectGetMaxX(high0Label.frame),CGRectGetMinY(high0Label.frame)},{40,20}}];
    self.highLabel=highLabel;
    [self setLabelAttu:highLabel text:@"0.00" textColor:[UIColor redColor]];
    
    UILabel * low0Label =[[UILabel alloc] initWithFrame:(CGRect){{CGRectGetMaxX(highLabel.frame),CGRectGetMinY(highLabel.frame)},{40,20}}];
    
    [self setLabelAttu:low0Label text:@"最低价:" textColor:[UIColor  blackColor]];
    
    UILabel * lowLabel =[[UILabel alloc] initWithFrame:(CGRect){{CGRectGetMaxX(low0Label.frame),CGRectGetMinY(low0Label.frame)},{40,20}}];
    self.lowLabel= lowLabel;
    [self setLabelAttu:lowLabel text:@"0.00" textColor:[UIColor redColor]];
    
}
- (void)setLabelAttu:(UILabel *)label text:(NSString *)text textColor:(UIColor *)textColor
{
    label.text = text; label.textColor = textColor; label.font =[UIFont fontWithName:@"Arial-BoldItalicMT" size:12];

    [self.view addSubview:label];
    
}
- (void)replaceStrMaString:(NSString *)maString ma10:(NSString *)ma10 ma20:(NSString *)ma20 em:(NSString *)em close:(NSString *)close high:(NSString *)high low:(NSString *)low;
{
    self.ma5Label.text =maString; self.ma10Label.text = ma10; self.ma20Label.text = ma20;
    self.emLabel.text = em; self.closeLabel.text = close; self.highLabel.text = high; self.lowLabel.text= low;

}


@end
