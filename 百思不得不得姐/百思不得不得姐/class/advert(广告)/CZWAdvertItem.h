//
//  CZWAdvertItem.h
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/21.
//  Copyright © 2016年 百度. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZWAdvertItem : NSObject
@property (nonatomic,copy)NSString *ori_curl;
@property (nonatomic,copy)NSString *w_picurl;
@property (nonatomic,assign)CGFloat w;
@property (nonatomic,assign)CGFloat h;
+ (instancetype)advertItemWithDictionary:(NSDictionary *)dict;

@end
