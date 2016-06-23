//
//  CZWSubTagItem.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/22.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWSubTagItem.h"

@implementation CZWSubTagItem
+ (instancetype)subTagItemWithDictionary:(NSDictionary *)dict
{
    CZWSubTagItem *item = [[CZWSubTagItem alloc]init];
    item.sub_number = dict[@"sub_number"];
    item.theme_name = dict[@"theme_name"];
    item.image_list = dict[@"image_list"];
    return item;
}
@end
