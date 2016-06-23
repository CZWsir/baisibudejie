//
//  CZWMeItem.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/23.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWMeItem.h"

@implementation CZWMeItem
+ (instancetype)meItemWithDictionary:(NSDictionary *)dict
{
    CZWMeItem *item = [[CZWMeItem alloc]init];
    item.icon = dict[@"icon"];
    item.name = dict[@"name"];
    item.url = dict[@"url"];
    return item;
}
@end
