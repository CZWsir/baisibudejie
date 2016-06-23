//
//  AppDelegate.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/17.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "AppDelegate.h"
#import "CZWTabBarController.h"
#import "CZWAnimateViewController.h"
#import "CZWadvertController.h"
@interface AppDelegate ()<UITabBarControllerDelegate>
@property (nonatomic,strong)CZWAnimateViewController *animate;
@end

@implementation AppDelegate
/*
  1.项目结构搭建 UITaBarController和UINavgationController组成
  2.设置窗口的根控制器为UITabBarController
 3.设置窗口根控制器两种方式：storyboard,纯代码
 3.1 程序启动原理
 4.显示完下面条，显示上面导航条
  5.添加导航控制器作为子控制器，如何判断有多少个子控制器呢，
  5.1 有多少个按钮，就有多少个子控制器。
  5.2 导航控制器需要根控制器，显示最外面的就是导航控制器的根控制器，每个界面有自己的业务逻辑，因此需要自定义所有导航控制器的根控制器
  5.3 讲解项目结构，和切换原理。
 
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //设置主窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
     CZWTabBarController *mainBar = [[CZWTabBarController alloc]init];
    //广告界面
    CZWadvertController *advert = [[CZWadvertController alloc]init];
    self.window.rootViewController = advert;
    //添加窗口控制器
//    self.window.rootViewController = mainBar;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
/*- (nullable id <UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController
                        interactionControllerForAnimationController: (id <UIViewControllerAnimatedTransitioning>)animationController
{
    
    CZWAnimateViewController *animate = [[CZWAnimateViewController alloc]init];
    self.animate = animate;
    return animate;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
                animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                                       toViewController:(UIViewController *)toVC
{
    CZWAnimateViewController *animate = [[CZWAnimateViewController alloc]init];
    return animate;
}*/
@end
