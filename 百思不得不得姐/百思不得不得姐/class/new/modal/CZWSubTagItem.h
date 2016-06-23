//
//  CZWSubTagItem.h
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/22.
//  Copyright © 2016年 百度. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZWSubTagItem : NSObject
@property (nonatomic,copy)NSString *sub_number;
@property (nonatomic,copy)NSString *theme_name;
@property (nonatomic, copy)NSString *image_list;
+ (instancetype)subTagItemWithDictionary:(NSDictionary *)dict;
@end
