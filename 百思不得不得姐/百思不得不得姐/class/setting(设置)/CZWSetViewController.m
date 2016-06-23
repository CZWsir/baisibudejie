//
//  CZWSetViewController.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/19.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWSetViewController.h"
#import <UIImageView+WebCache.h>
#import <SDImageCache.h>
#import "CZWFileManager.h"
@implementation CZWSetViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ID"];
    self.view.backgroundColor = [UIColor greenColor];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ID"];
    //获取文件尺寸
//    [self getFileSize];
    
    cell.textLabel.text = [self getCellString];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    NSFileManager *file = [NSFileManager defaultManager];
    
     NSString *cacheStr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
//    NSLog(@"%@",cacheStr);
    NSLog(@"%@",cacheStr);
    [CZWFileManager removeDirectoryPath:cacheStr];
//    NSArray *DirctArray = [file contentsOfDirectoryAtPath:cacheStr error:nil];
//    
//    for (NSString *path in DirctArray) {
//        if ([path containsString:@".DS"]) continue;
//        
//       NSString *filePath = [cacheStr stringByAppendingPathComponent:path];
//      
//        [file removeItemAtPath:filePath error:nil];
//    }
    [self.tableView reloadData];
}
- (NSString *)getCellString
{
    NSString *pathStr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
//    NSLog(@"%@",pathStr);
    NSInteger size = [CZWFileManager getFileSizeWithPath:pathStr];
    NSLog(@"%ld",size);
    NSString *str = nil;
    if (size > 1000 * 1000) {
        CGFloat MB = 1.0 * size / (1000 * 1000);
       str = [NSString stringWithFormat:@"清除缓存%0.1lfM",MB];
    }else if(size > 1000){
        CGFloat MB = size / 1000;
       str = [NSString stringWithFormat:@"清除缓存%0.1lfKB",MB];
    }else if(size < 1000){
       str = [NSString stringWithFormat:@"清除缓存%ldB",size];
    }
    return str;
}
- (NSInteger)getFileSizeWithPath:(NSString*)pathStr
{
 
   NSInteger size = [[SDImageCache sharedImageCache]getSize];
    NSLog(@"%ld",size);
    pathStr = [pathStr stringByAppendingPathComponent:@"default"];
    
//    NSLog(@"%@",pathStr);
    NSFileManager *file = [NSFileManager defaultManager];
    NSArray *pathArray = [file subpathsOfDirectoryAtPath:pathStr error:nil];
//    NSLog(@"%@",pathArray);
    NSInteger total = 0;
    for (NSString *path in pathArray) {
       NSString *str = [pathStr stringByAppendingPathComponent:path];
        NSDictionary *pathDict = [file attributesOfItemAtPath:str error:nil];
        NSString *number = pathDict[@"NSFileSize"];
        total += number.floatValue;
    }
    return total;
}
@end
