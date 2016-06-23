//
//  UIView+bs_frame.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/18.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "UIView+bs_frame.h"

@implementation UIView (bs_frame)
- (CGFloat)bs_height
{
    return self.frame.size.height;
}
- (void)setBs_height:(CGFloat)bs_height
{
    CGRect rect = self.frame;
    rect.size.height = bs_height;
    self.frame = rect;
}
- (CGFloat)bs_width
{
    return self.frame.size.width;
}
- (void)setBs_width:(CGFloat)bs_width
{
    CGRect rect = self.frame;
    rect.size.width = bs_width;
    self.frame = rect;
}
- (CGFloat)bs_x
{
    return self.frame.origin.x;
}
- (void)setBs_x:(CGFloat)bs_x
{
    CGRect rect = self.frame;
    rect.origin.x = bs_x;
    self.frame = rect;
}
- (CGFloat)bs_y
{
    return self.frame.origin.y;
}
- (void)setBs_y:(CGFloat)bs_y
{
    CGRect rect = self.frame;
    rect.origin.y = bs_y;
    self.frame = rect;
}
- (CGFloat)bs_centerX
{
    return self.center.x;
}
- (void)setBs_centerX:(CGFloat)bs_centerX
{
    CGPoint size = self.center;
    size.x = bs_centerX;
    self.center = size;
}
- (CGFloat)bs_centerY
{
    return self.center.y;
}
- (void)setBs_centerY:(CGFloat)bs_centerY
{
    CGPoint size = self.center;
    size.y = bs_centerY;
    self.center = size;
}
@end
