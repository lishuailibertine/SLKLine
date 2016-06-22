# SLKLine
一个具有周~月~日~蜡烛线，MA5,10,20平均线，成交量曲线等功能并且可扩展的股票K线图。
##随便说一下
*这个demo是在做一个证券类的项目时写的。在开始写demo之前也看了下网上的一些朋友写的代码，反正我是看不太懂，于是索性自己就当练手了。写完一部分后就上传在此。第一呢就是想以后用的时候自己方便找，第二呢说不定可以给其他朋友一些帮助*。

##简单介绍
demo主要使用了`CoreGraphics`框架里面的一些API来完成绘图功能。demo有几个重要的部分：数据请求装配 (完成对指定数据结构的解析再装配)；模型model;显示部分view(显示部分的一些业务操作通过代理去完成)。
##使用上的简单说明
```objective-c
//创建一个画蜡烛K线的区域，设置绘制代理和手势代理
 SLKAearView * aearview =[[SLKAearView alloc] initWithFrame:(CGRect){{SLAearWrite,125},{self.view.bounds.size.width-SLAearWrite*2,SLKLineHigh}}];
 [aearView setGestureRecognizers:[[SLAearViewGesture alloc] init]];
 [aearView setAearViewDelegate:[[SLAearDraw alloc] init]];
 [self.view addSubview:aearView];
```
##效果预览
![效果预览](https://github.com/lishuailibertine/SLKLine/blob/master/KLine.png)
