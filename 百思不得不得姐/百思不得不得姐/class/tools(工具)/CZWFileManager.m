//
//  CZWFileManager.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/23.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWFileManager.h"

@implementation CZWFileManager
/**
 *根据路径获取文件的大小
 */
+ (NSInteger)getFileSizeWithPath:(NSString*)pathStr
{
    NSFileManager *file = [NSFileManager defaultManager];
    //判断
    BOOL isDirectory;
    BOOL isExist = [file fileExistsAtPath:pathStr isDirectory:&isDirectory];
    if (!isExist||!isDirectory) {
        NSException *exception = [NSException exceptionWithName:@"filePathError" reason:@"请传对文件夹路径" userInfo:nil];
        [exception raise];
    }
        
    NSArray *pathArray = [file subpathsOfDirectoryAtPath:pathStr error:nil];
    
    NSInteger total = 0;
    for (NSString *path in pathArray) {
        NSString *str = [pathStr stringByAppendingPathComponent:path];
        NSDictionary *pathDict = [file attributesOfItemAtPath:str error:nil];
//        BOOL isDirectory;
//        BOOL isExist = [file fileExistsAtPath:pathStr isDirectory:&isDirectory];
//        if (isDirectory||!isExist)continue;
        
        NSString *number = pathDict[@"NSFileSize"];
        total += number.floatValue;
    }
    return total;
}

+ (void)removeDirectoryPath:(NSString *)directoryPath
{
    NSFileManager *file = [NSFileManager defaultManager];
    
    BOOL isDirectory;
    BOOL isExist = [file fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    if (!isExist||!isDirectory) {
        NSException *exception = [NSException exceptionWithName:@"filePathError" reason:@"+++请传对文件夹路径" userInfo:nil];
        [exception raise];
    }
      NSArray *DirctArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:nil];
    for (NSString *path in DirctArray) {
        
//        if ([path containsString:@".DS"]) continue;
        
    NSString *filePath = [directoryPath stringByAppendingPathComponent:path];
        
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    }
}
@end
