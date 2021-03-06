//
//  UINavigationItem+setButton.h
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/18.
//  Copyright © 2016年 百度. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (setButton)

+ (UIBarButtonItem *)barButtonItemWithBtnNormalImage:(NSString *)image HightNight:(NSString *)hightImage targe:(id)targe action:(SEL)sel;
+ (UIBarButtonItem *)barButtonItemWithBtnNormalImage:(NSString *)image selectImage:(NSString *)hightImage targe:(id)targe action:(SEL)sel;
@end
