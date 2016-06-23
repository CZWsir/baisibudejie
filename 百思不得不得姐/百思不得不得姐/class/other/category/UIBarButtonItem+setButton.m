//
//  UINavigationItem+setButton.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/18.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "UIBarButtonItem+setButton.h"

@implementation UIBarButtonItem (setButton)
+ (UIBarButtonItem *)barButtonItemWithBtnNormalImage:(NSString *)image HightNight:(NSString *)hightImage targe:(id)targe action:(SEL)sel
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [btn addTarget:targe action:sel forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    
    UIView *view = [[UIView alloc]initWithFrame:btn.bounds];
    
    [view addSubview:btn];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:view];
    
    return item;
}
+ (UIBarButtonItem *)barButtonItemWithBtnNormalImage:(NSString *)image selectImage:(NSString *)hightImage targe:(id)targe action:(SEL)sel
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn addTarget:targe action:sel forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:hightImage] forState:UIControlStateSelected];
    [btn sizeToFit];
    
    UIView *view = [[UIView alloc]initWithFrame:btn.bounds];
    
    [view addSubview:btn];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:view];
    
    return item;
}

@end
