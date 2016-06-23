//
//  CZWEssenceViewController.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/17.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWEssenceViewController.h"
#import "UIImage+render.h"
#import "UIBarButtonItem+setButton.h"
@interface CZWEssenceViewController ()

@end

@implementation CZWEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithBtnNormalImage:@"nav_item_game_icon" HightNight:@"nav_item_game_click_icon" targe:self action:@selector(game)];
    //设置首页标题
    UIImage *image = [UIImage imageNamed:@"MainTitle"];
    UIImageView *view = [[UIImageView alloc]initWithImage:image];
    self.navigationItem.titleView = view;
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithBtnNormalImage:@"navigationButtonRandom" HightNight:@"navigationButtonRandomClick" targe:self action:@selector(random)];

}
- (void)game
{
    CZWLog(@"game");
}
- (void)random
{
    CZWLog(@"random");
}
@end
