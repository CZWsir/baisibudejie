//
//  CZWMeViewController.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/17.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWMeViewController.h"
#import "CZWSetViewController.h"
#import "CZWSquareCell.h"
#import "CZWMeItem.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <SafariServices/SafariServices.h>
#import "CZWWebViewController.h"
#define cols 4
#define margin 3
@interface CZWMeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,weak)UIBarButtonItem *moonItem;
@property (nonatomic,strong)NSMutableArray *itemArray;
@property (nonatomic,weak)UICollectionView *collectionView;
@property (nonatomic,assign)CGFloat itemHW;
@end

@implementation CZWMeViewController
- (NSMutableArray *)itemArray
{
    if (!_itemArray) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setNav];
    [self setUpFooterView];
    
//     self.navigationController.navigationBarHidden = YES;
    
    self.tableView.sectionFooterHeight = 10;
    
    self.tableView.sectionHeaderHeight = 0;
    
    NSLog(@"%@",NSStringFromUIEdgeInsets(self.tableView.contentInset));
//    NSLog(@"%@",NSStringFromUIEdgeInsets(self.tableView.))
//    self.tableView.tableHeaderView = [[UIView alloc]init];
    NSLog(@"%@",NSStringFromCGSize(self.tableView.contentSize));
    
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    [self loadData];
    
    NSLog(@"%@",NSStringFromCGPoint(self.tableView.contentOffset));
}
- (void)loadData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"square";
    parameters[@"c"] = @"topic";
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        
        [responseObject writeToFile:@"/Users/chenzewei/Desktop/百思不得不得姐/test/one.plist" atomically:YES];
        NSArray *array = responseObject[@"square_list"];
        
//       self.itemArray = [CZWMeItem mj_keyValuesArrayWithObjectArray:array];
        for (NSDictionary *dict in array) {
            NSMutableDictionary *mutable = [NSMutableDictionary dictionary];
            mutable[@"icon"] = dict[@"icon"];
            mutable[@"name"] = dict[@"name"];
            mutable[@"url"] = dict[@"url"];
            CZWMeItem *item = [CZWMeItem meItemWithDictionary:mutable];
            [self.itemArray addObject:item];
            
        }
        //处理数据
        [self resolveData];
        //刷新
        [self.collectionView reloadData];
        //计算cell的高度
        int num = (int)self.itemArray.count / cols;
        
       CGFloat ViewH = self.itemHW * num + (num - 1) * margin;
        
        self.collectionView.bs_height = ViewH;
        // 设置tableView滚动范围 => tableView滚动范围是系统会自动根据内容去计算
        self.tableView.tableFooterView = self.collectionView;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
- (void)resolveData
{
   int index = self.itemArray.count % cols;
    if (index) {
        int number = cols - index;
        for (int i = 0; i < number; i++) {
            CZWMeItem *item = [[CZWMeItem alloc]init];
            [self.itemArray addObject:item];
        }
        
    }
}
//流水布局
 NSString *ID = @"ID";
- (void)setUpFooterView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //计算cell高度
   
    
    CGFloat itemHW = (CZWwidth - (cols - 1) * margin)/cols;
    layout.minimumInteritemSpacing = margin;
    layout.minimumLineSpacing = margin;
    
    self.itemHW = itemHW;
    layout.itemSize = CGSizeMake(itemHW, itemHW);

    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0 , 300) collectionViewLayout:layout];
    self.collectionView = collectionView;
    
    
    collectionView.backgroundColor = [UIColor greenColor];
    //设置数据源
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    self.tableView.tableFooterView = collectionView;
    
    
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CZWSquareCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
    
 
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.itemArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CZWSquareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
//    NSLog(@"%ld",indexPath.row);
    cell.item = self.itemArray[indexPath.row];
    return cell;
}

- (void)setting
{
    CZWSetViewController *vc = [[CZWSetViewController alloc]init];
/*//    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 44)];
    
//    UILabel *lable = [[UILabel alloc]init];
//    
//    lable.text = @"返回";
    
//    [view addSubview:lable];
//
//
//
//    UIButton *but = [[UIButton alloc]init];
//    [but setTitle:@"返回" forState:UIControlStateNormal];
//    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:but];
//        NSLog(@"%@",item);
//    self.navigationItem.backBarButtonItem = item;*/
    [self.navigationController pushViewController:vc animated:YES];
//     NSLog(@"%@",self.navigationItem.backBarButtonItem);
//    NSLog(@"%@",vc.navigationItem.backBarButtonItem);
}
//月亮
- (void)moon
{
    UIButton *btn = (UIButton *)self.moonItem.customView.subviews.lastObject;
    btn.selected = !btn.selected;
}
- (void)setNav
{
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.title = @"我";
    [UIImage imageNamed:@"mine-moon-icon"];
    [UIImage imageNamed:@"mine-setting-icon"];
    [UIImage imageNamed:@"mine-setting-icon-click"];
    UIBarButtonItem *btnSet = [UIBarButtonItem barButtonItemWithBtnNormalImage:@"mine-setting-icon" HightNight:@"mine-setting-icon-click" targe:self action:@selector(setting)];
    
    UIBarButtonItem *btnMoon = [UIBarButtonItem barButtonItemWithBtnNormalImage:@"mine-moon-icon" selectImage:@"mine-moon-icon-click" targe:self action:@selector(moon)];
    self.moonItem = btnMoon;
    self.navigationItem.rightBarButtonItems = @[btnSet,btnMoon];
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CZWMeItem *me = self.itemArray[indexPath.row];
    if (![me.url containsString:@"http"]) return;
    
    NSURL *url = [NSURL URLWithString:me.url];
//    SFSafariViewController *safar = [[SFSafariViewController alloc]initWithURL:url];
////    [self.navigationController pushViewController:safar animated:YES];
//    
//    [self presentViewController:safar animated:YES completion:nil];
////    self.navigationController.navigationBarHidden = YES;
    
    CZWWebViewController *web = [[CZWWebViewController alloc]init];
    
    web.url = url;
    
//    [self presentViewController:web animated:YES completion:nil];
    [self.navigationController pushViewController:web animated:YES];
}
@end
