//
//  UITabBarItem+ImageTitle.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/18.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "UITabBarItem+ImageTitle.h"
#import "UIImage+render.h"
@implementation UITabBarItem (ImageTitle)
- (void)setImage:(NSString *)image WithSelectImage:(NSString *)selectImage Title:(NSString *)word
{
    self.image = [UIImage imageNamed:image];
    self.selectedImage = [UIImage imageToOriginalWithString:selectImage];
    self.title = word;
}
@end
