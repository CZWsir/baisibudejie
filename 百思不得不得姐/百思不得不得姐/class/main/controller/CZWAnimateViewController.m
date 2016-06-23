//
//  CZWAnimateViewController.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/17.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWAnimateViewController.h"

@interface CZWAnimateViewController ()


@end

@implementation CZWAnimateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)startInteractiveTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
//    BOOL bo = [transitionContext isAnimated];
//    UIView *view = [transitionContext containerView];
}
- (CGFloat)completionSpeed
{
    return 0.5;
}
- (UIViewAnimationCurve)completionCurve
{
    return UIViewAnimationCurveEaseInOut;
}
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 3;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
}

@end
