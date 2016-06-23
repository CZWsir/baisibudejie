//
//  CZWNewViewController.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/17.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWNewViewController.h"
#import "CZWTagTableViewController.h"
@interface CZWNewViewController ()

@end

@implementation CZWNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];

    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithBtnNormalImage:@"MainTagSubIcon" HightNight:@"MainTagSubIconClick" targe:self action:@selector(mainTag)];
    UIImage *image = [UIImage imageNamed:@"MainTitle"];
    UIImageView *view = [[UIImageView alloc]initWithImage:image];
    self.navigationItem.titleView = view;
   
}
-(void)mainTag
{
    CZWTagTableViewController *tag = [[CZWTagTableViewController alloc]init];
    
    [self.navigationController pushViewController:tag animated:YES];
}

@end
