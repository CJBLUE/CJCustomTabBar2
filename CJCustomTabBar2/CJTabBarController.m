//
//  TabBarController.m
//  CJCustomTabBar2
//
//  Created by zxjk on 17/8/14.
//  Copyright © 2017年 zxjk. All rights reserved.
//

#import "CJTabBarController.h"
#import "CJCustomTabBar.h"

@interface CJTabBarController () <CJTabBarViewDelegate>

@end

@implementation CJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 利用 KVC 来使用自定义的tabBar；
    CJCustomTabBar *tabBar = [[CJCustomTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
    tabBar.tabBarView.delegate = self;
    [self createControllers];
}
#pragma mark 创建controller
- (void)createControllers
{
    NSArray *titleArr = @[@"首页", @"发现", @"收藏", @"设置"];

    for (NSInteger i = 0; i < titleArr.count; i++) {
        // 对应controller
        UIViewController *VC = [[UIViewController alloc] init];
        VC.view.backgroundColor = [UIColor colorWithRed:255.0/3*i/255.0 green:255.0/3*i/255.0 blue:255.0/3*i/255.0 alpha:1];
        // 创建navigation
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
        // nav标题
        VC.navigationItem.title = titleArr[i];
        // 添加
        [self addChildViewController:nav];
    }
}

#pragma mark CJTabBarView delegate
- (void)selectIndex:(NSInteger)index
{
    self.selectedIndex = index;
    NSLog(@"%ld", index);
}
- (void)selectCenter
{
    NSLog(@"center");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
