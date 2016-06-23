//
//  CZWadvertController.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/20.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWadvertController.h"
#import <AFNetworking.h>
#import "CZWAdvertItem.h"
#import "CZWAdvertItem.h"
#import <UIImageView+WebCache.h>
#import "CZWTabBarController.h"
#define ADURL @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

#define  Iphone5 (CZWheight == 568)
#define  Iphone6 (CZWheight == 667)
#define Iphone6P (CZWheight == 736)
#define Iphone4 (CZWheight == 480)
@interface CZWadvertController()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *adView;
@property (weak, nonatomic) UIImageView *adImageView;
@property (strong, nonatomic)CZWAdvertItem *item;
@property (weak,nonatomic)NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIButton *jumpButton;

@end
@implementation CZWadvertController
- (UIImageView *)adImageView
{
    if (!_adImageView) {

        UIImageView *adimageView = [[UIImageView alloc]init];
        _adImageView = adimageView;
        adimageView.userInteractionEnabled = YES;
        
        [self.adView addSubview:adimageView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
        [adimageView addGestureRecognizer:tap];
    }
    return _adImageView;
}
//跳转装
- (void)tap
{
    UIApplication *app = [UIApplication sharedApplication];
   
    if ([_item.ori_curl containsString:@" "]) {
        NSMutableString *str = (NSMutableString *)_item.ori_curl;

       NSString *str1 = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSURL *url = [NSURL URLWithString:str1]; if ([app canOpenURL:url]) {
            [app openURL:url];
        }
    }
    
    
   
}
- (void)viewDidLoad
{
    [self downLoad];
    [super viewDidLoad];
    [self setUpLaunch];
    [self setTime];
}
- (void)setTime
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
    self.timer = timer;
}
- (void)setUpLaunch
{
    if (Iphone6) {
        self.imageView.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    }else if(Iphone6P){
        self.imageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }else if (Iphone4){
        self.imageView.image = [UIImage imageNamed:@"LaunchImage-700"];
    }else if(Iphone5){
        self.imageView.image = [UIImage imageNamed:@"LaunchImage-700-568h"];
    }
    
}
 static int second = 3;
- (void)timerChange
{
   
     second--;


    [self.jumpButton setTitle:[NSString stringWithFormat:@"跳过(%d)",second] forState:UIControlStateNormal];
    if (second < 0) {
        [self.timer invalidate];
 
        [self jump:nil];
    }
    
}
- (IBAction)jump:(UIButton *)sender {
    
    [self.timer invalidate];
    CZWTabBarController *tab = [[CZWTabBarController alloc]init];
    [UIView animateWithDuration:0.25 animations:^{
      [UIApplication sharedApplication].keyWindow.rootViewController = tab;
    }];
    
}

// 请求数据 -> 查看接口文档 -> 测试接口有没有问题 -> 解析数据(w_picurl,ori_curl:广告界面跳转地址,w,h) arr = dict[@"ad"]
- (void)downLoad
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"code2"] = ADURL;
    
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    
    [manager GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary   * _Nullable responseObject) {
        if (responseObject == nil) {
            return ;
        }
        NSDictionary *dict = responseObject[@"ad"][0];

        CZWAdvertItem *item = [CZWAdvertItem advertItemWithDictionary:dict];
        
           self.item = item;
        CGFloat w = CZWwidth;
        
        CGFloat h = w/item.w * item.h;
        
        self.adImageView.frame = CGRectMake(0, 0, w, h);
        
        NSURL *url = [NSURL URLWithString:item.w_picurl];
        
     
        [self.adImageView sd_setImageWithURL:url];
    
//        NSLog(@"%@",item);ori_curl
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
    
}
@end
