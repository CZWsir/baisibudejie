//
//  CZWFastLogin.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/22.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWFastLogin.h"

@implementation CZWFastLogin
+ (instancetype)fastLogin
{
  return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}
- (IBAction)sender:(id)sender{
    NSLog(@"%s",__func__);
    
}
@end
