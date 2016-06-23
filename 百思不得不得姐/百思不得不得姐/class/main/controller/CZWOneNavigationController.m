//
//  CZWOneNavigationController.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/19.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWOneNavigationController.h"
#import "CZWMeViewController.h"
@interface CZWOneNavigationController()<UIGestureRecognizerDelegate>
@end
@implementation CZWOneNavigationController
+ (void)load
{
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    bar.titleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:20]};
     [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
}
//<UIScreenEdgePanGestureRecognizer: 0x7fdd6b4a31a0; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7fdd6b51b630>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7fdd6b4a2bd0>)>>

//<_UINavigationInteractiveTransition: 0x7fdb9bf23770>
- (void)viewDidLoad
{
    [super viewDidLoad];
//   NSLog(@"%@",self)
//    self.hidesBarsOnTap = YES;
//    self.hidesBarsOnSwipe = YES;
//    NSLog(@"%@",self.interactivePopGestureRecognizer);
//    NSLog(@"%@",self.interactivePopGestureRecognizer.delegate);
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
    self.interactivePopGestureRecognizer.enabled = NO;
    self.interactivePopGestureRecognizer.delegate = nil;
//    self.interactivePopGestureRecognizer.delegate = self;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    NSInteger count = self.viewControllers.count;
    
    if (count > 0) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"返回" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
        [btn sizeToFit];
        viewController.hidesBottomBarWhenPushed = YES;
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 15);
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
        viewController.navigationItem.leftBarButtonItem = item;
    }
    
    [super pushViewController:viewController animated:YES];

    
}
- (void)pop
{

    [self popViewControllerAnimated:YES];
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{

    NSLog(@"%lu",self.childViewControllers.count);
//    CGPoint point = [gestureRecognizer locationInView:nil];
//    CZWMeViewController *me = self.childViewControllers[0];
//    if ([point.view] ) {
//        return NO;
//    }else{
//        return YES; 
//    }
    return self.childViewControllers.count > 1;
//    return  YES;
}
@end
