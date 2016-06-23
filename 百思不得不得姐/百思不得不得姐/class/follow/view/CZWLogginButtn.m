//
//  CZWLogginButtn.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/22.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWLogginButtn.h"

@implementation CZWLogginButtn

- (void)layoutSubviews
{
    [super layoutSubviews];
    //布置图片
    self.imageView.bs_centerX = self.frame.size.width * 0.5;
    self.imageView.bs_y = 0;
    //布置文字
//    [self.titleLabel sizeToFit];
    self.titleLabel.bs_centerX = self.frame.size.width * 0.5;
    self.titleLabel.bs_y = self.bs_height - self.titleLabel.bs_height;
}

@end
