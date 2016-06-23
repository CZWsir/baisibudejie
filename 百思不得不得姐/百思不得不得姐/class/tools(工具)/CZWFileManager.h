//
//  CZWFileManager.h
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/23.
//  Copyright © 2016年 百度. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZWFileManager : NSObject
/**
 *根据路径获取文件的大小
 *返回文件夹中子文件的大小
 */

+ (NSInteger)getFileSizeWithPath:(NSString*)pathStr;


/**
 * 传进文件夹路径，删除里面的文件
 * 
 *
 */
+ (void)removeDirectoryPath:(NSString *)directoryPath;
@end
