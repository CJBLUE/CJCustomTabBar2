//
//  TabBarView.m
//  CJCustomTabBar2
//
//  Created by zxjk on 17/8/14.
//  Copyright © 2017年 zxjk. All rights reserved.
//

#import "CJTabBarView.h"

@implementation CJTabBarView
{
    NSInteger saveIndex;// 保存上次点击的index
}
#pragma mark 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        saveIndex = 100;
        [self createView];
    }
    return self;
}

#pragma mark 创建视图
- (void)createView
{
    NSArray *titleArr = @[@"首页", @"发现", @"收藏", @"设置"];
    NSArray *imageArr = @[@"wxb主页", @"iconfont-yiqiyibiao", @"iconfont-xingxing", @"iconfont-jixieqimo"];
    NSArray *selectImageArr = @[@"wxb主页-2", @"iconfont-yiqiyibiao-2", @"iconfont-xingxing-2", @"iconfont-jixieqimo-2"];
    // 设置item大小 根据项目具体情况修改
    CGFloat centerW = 80;
    CGFloat centerH = 60;
    CGFloat itemW = ([UIScreen mainScreen].bounds.size.width-80)/4.0;
    CGFloat itemH = 35;
    // 循环创建4个item
    for (int i = 0; i < imageArr.count; i++) {
        UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
        item.frame = CGRectMake(itemW * i + centerW * (i/2), 0, itemW, itemH);
        // 对，主页的图片还是那个灰的，不懂的童鞋去看（一），反正没有影响
        [item setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        [item setImage:[UIImage imageNamed:selectImageArr[i]] forState:UIControlStateSelected];
        [self addSubview:item];
        item.tag = 100+i;
        [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
        
        UILabel *itemLabel = [[UILabel alloc] initWithFrame:CGRectMake(itemW * i + centerW * (i/2), itemH, itemW, 14)];
        itemLabel.text = titleArr[i];
        [self addSubview:itemLabel];
        itemLabel.font = [UIFont systemFontOfSize:10];
        itemLabel.textColor = [UIColor blackColor];
        itemLabel.tag = 200+i;
        itemLabel.textAlignment = NSTextAlignmentCenter;
        
        if (i == 0) {
            [self itemClick:item];
        }
    }
    // 创建center
    UIButton *center = [UIButton buttonWithType:UIButtonTypeCustom];
    center.frame = CGRectMake(itemW*2, 49-centerH, centerW, centerH);
    [center setImage:[UIImage imageNamed:@"08"] forState:UIControlStateHighlighted];
    [center setImage:[UIImage imageNamed:@"08"] forState:UIControlStateNormal];
    [self addSubview:center];
    [center addTarget:self action:@selector(centerClick:) forControlEvents:UIControlEventTouchDown];
}
#pragma mark item点击事件
- (void)itemClick:(UIButton *)btn
{
    // 将之前点击的item恢复原样
    UIButton *tempB = [self viewWithTag:saveIndex];
    tempB.selected = NO;
    tempB.userInteractionEnabled = YES;
    
    UILabel *tempL = [self viewWithTag:saveIndex+100];
    tempL.textColor = [UIColor blackColor];
    
    // 将点击的item变成选中状态
    saveIndex = btn.tag;
    btn.selected = YES;
    btn.userInteractionEnabled = NO;
    
    UILabel *tempL1 = [self viewWithTag:saveIndex+100];
    tempL1.textColor = [UIColor colorWithRed:32/255.0 green:151/255.0 blue:217/255.0 alpha:1];
    
    if ([self.delegate respondsToSelector:@selector(selectIndex:)]) {
        [self.delegate selectIndex:btn.tag - 100];
    }
}
#pragma mark center点击事件
- (void)centerClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(selectCenter)]) {
        [self.delegate selectCenter];
    }
}

@end
