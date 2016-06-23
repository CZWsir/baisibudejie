//
//  CZWFollowViewController.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/17.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWFollowViewController.h"
#import "CZWLoginViewController.h"
@interface CZWFollowViewController ()

@end

@implementation CZWFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor yellowColor];
    
     self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithBtnNormalImage:@"friendsRecommentIcon" HightNight:@"friendsRecommentIcon-click" targe:self action:@selector(friend)];
    
    self.navigationItem.title = @"我的关注";
}
- (void)friend
{
    
}
- (IBAction)login:(UIButton *)sender {
    
    CZWLoginViewController *login = [[CZWLoginViewController alloc]init];
    [self presentViewController:login animated:YES completion:nil];
    
}


@end
