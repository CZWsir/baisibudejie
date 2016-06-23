//
//  CZWTagTableViewController.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/22.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWTagTableViewController.h"
#import "CZWSubTagItem.h"
#import "CZWTagTableViewCell.h"
#import <UIImageView+WebCache.h>
#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD.h>
@interface CZWTagTableViewController ()
@property (nonatomic,strong)NSMutableArray *ImageArray;
@property (nonatomic, strong)NSURLSessionDataTask *task;
@end

@implementation CZWTagTableViewController

- (NSMutableArray *)ImageArray
{
    if (!_ImageArray) {
        _ImageArray = [NSMutableArray array];
    }
    return _ImageArray;
}
static NSString *ID = @"subtag";
- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"推荐标签";
    [self loadData];
//    行高
//    self.tableView.rowHeight = 60;
//    注册cell
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.backgroundColor = [UIColor grayColor];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CZWTagTableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
}
//加载数据
- (void)loadData
{
    AFHTTPSessionManager *manager =  [AFHTTPSessionManager manager];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"a"] = @"tag_recommend";
    
    parameters[@"action"] = @"sub";
    
    parameters[@"c"] = @"topic";
    
    [SVProgressHUD show];
    _task = [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray  *_Nullable responseObject) {
        [SVProgressHUD dismiss];
        for (NSDictionary *ary in responseObject) {
            NSMutableDictionary *mutable = [NSMutableDictionary dictionary];
            mutable[@"sub_number"] = ary[@"sub_number"];
            mutable[@"theme_name"] = ary[@"theme_name"];
            mutable[@"image_list"] = ary[@"image_list"];
            CZWSubTagItem *tag = [CZWSubTagItem subTagItemWithDictionary:mutable];
            [self.ImageArray addObject:tag];
        }
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [SVProgressHUD dismiss];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return self.ImageArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CZWTagTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    CZWSubTagItem *tag = self.ImageArray[indexPath.row];
    
    cell.item = tag;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [SVProgressHUD dismiss];
    [_task cancel];
}
@end
