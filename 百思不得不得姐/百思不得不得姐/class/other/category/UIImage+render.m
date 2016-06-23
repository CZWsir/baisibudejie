//
//  UIImage+render.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/17.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "UIImage+render.h"

@implementation UIImage (render)
+ (UIImage *)imageToOriginalWithString:(NSString *)ImageString
{
        UIImage *image = [UIImage imageNamed:ImageString];
    
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
      return image;
}
@end
