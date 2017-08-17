//
//  TabBarView.h
//  CJCustomTabBar2
//
//  Created by zxjk on 17/8/14.
//  Copyright © 2017年 zxjk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CJTabBarViewDelegate <NSObject>
// 返回点击index
- (void)selectIndex:(NSInteger)index;
// 点击center
- (void)selectCenter;

@end

@interface CJTabBarView : UIView

@property (nonatomic, assign) id <CJTabBarViewDelegate> delegate;

@end
