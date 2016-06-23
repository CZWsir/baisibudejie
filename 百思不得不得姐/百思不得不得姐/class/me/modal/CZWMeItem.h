//
//  CZWMeItem.h
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/23.
//  Copyright © 2016年 百度. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZWMeItem : NSObject
@property (nonatomic,copy)NSString *icon;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *url;
+ (instancetype)meItemWithDictionary:(NSDictionary *)dict;
@end
