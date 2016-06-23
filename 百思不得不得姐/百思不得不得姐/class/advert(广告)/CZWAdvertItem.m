//
//  CZWAdvertItem.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/21.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWAdvertItem.h"

@implementation CZWAdvertItem
+ (instancetype)advertItemWithDictionary:(NSDictionary *)dict
{
    CZWAdvertItem *item = [[CZWAdvertItem alloc]init];
//    [item setValuesForKeysWithDictionary:dict];
    NSString *str = dict[@"w"];
    NSString *st = dict[@"h"];
    item.w = str.floatValue;
    item.ori_curl = dict[@"ori_curl"];

    item.w_picurl = dict[@"w_picurl"];
    item.h = st.floatValue;
    return item;
}
@end
