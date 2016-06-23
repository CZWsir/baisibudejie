//
//  CZWTabBarController.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/17.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWTabBarController.h"
#import "CZWEssenceViewController.h"
#import "CZWFollowViewController.h"
#import "CZWMeViewController.h"
#import "CZWNewViewController.h"
#import "CZWPublicViewController.h"
#import "UIImage+render.h"
#import "CZWMainTabBar.h"
#import "UITabBarItem+ImageTitle.h"
#import "CZWOneNavigationController.h"
@interface CZWTabBarController ()

@end

@implementation CZWTabBarController

+ (void)load
{
    UITabBarItem *item = [UITabBarItem appearance];

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    NSMutableDictionary *dictFont = [NSMutableDictionary dictionary];
    dictFont[NSFontAttributeName] = [UIFont systemFontOfSize:13];

    [item setTitleTextAttributes:dictFont forState:UIControlStateNormal];
    
//    item.imageInsets = UIEdgeInsetsMake(10, 0, 0, 0);
//    ,
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpController];
    [self setUpAllTitle];
//    NSLog(@"%@",self.tabBar.subviews);
    [self setUpTabBar];
    
}
- (void)setUpTabBar
{
    CZWMainTabBar *bar = [[CZWMainTabBar alloc]init];
    
    [self setValue:bar forKey:@"tabBar"];
}
- (void)setUpController
{
    //根控制器添加子控件
    //  精华
    CZWEssenceViewController *essenceVc = [[CZWEssenceViewController alloc]init];
    CZWOneNavigationController *nav1 = [[CZWOneNavigationController alloc]initWithRootViewController:essenceVc];
    
    [self addChildViewController:nav1];
    
    //新帖
    CZWNewViewController *newVc = [[CZWNewViewController alloc]init];
    CZWOneNavigationController *nav2 = [[CZWOneNavigationController alloc]initWithRootViewController:newVc];
    
    [self addChildViewController:nav2];
    
//    //发布
//    CZWPublicViewController *publicVc = [[CZWPublicViewController alloc]init];
//    
//    [self addChildViewController:publicVc];
    
    //关注
    CZWFollowViewController *followVc = [[CZWFollowViewController alloc]init];
    CZWOneNavigationController *nav4 = [[CZWOneNavigationController alloc]initWithRootViewController:followVc];
    
    [self addChildViewController:nav4];
    
    //我
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"CZWMeViewController" bundle:nil];
    
    CZWMeViewController *meVC = [board instantiateInitialViewController];
    CZWOneNavigationController *nav5 = [[CZWOneNavigationController alloc]initWithRootViewController:meVC];
    
    [self addChildViewController:nav5];
    
}
//给tabar上设置内容，主要有控制器的tabarItem确定
- (void)setUpAllTitle
{
    //精华
    CZWOneNavigationController *nav = self.viewControllers[0];
   [nav.tabBarItem setImage:@"tabBar_essence_icon" WithSelectImage:@"tabBar_essence_click_icon" Title:@"精华"];
    //新帖
    CZWOneNavigationController *nav1 = self.viewControllers[1];
    [nav1.tabBarItem setImage:@"tabBar_new_icon" WithSelectImage:@"tabBar_new_click_icon" Title:@"新帖"];
    //关注
    CZWOneNavigationController *nav3 = self.viewControllers[2];
    [nav3.tabBarItem setImage:@"tabBar_friendTrends_icon" WithSelectImage:@"tabBar_friendTrends_click_icon" Title:@"关注"];
    //我的
    CZWOneNavigationController *nav4 = self.viewControllers[3];
    [nav4.tabBarItem setImage:@"tabBar_me_icon" WithSelectImage:@"tabBar_me_click_icon" Title:@"我的"];
    
}

@end
