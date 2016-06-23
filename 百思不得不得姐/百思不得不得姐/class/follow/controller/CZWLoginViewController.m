//
//  CZWLoginViewController.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/22.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWLoginViewController.h"
#import "CZWMiddleView.h"
#import "CZWFastLogin.h"
@interface CZWLoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMiddle;
@property (weak, nonatomic) IBOutlet UIView *bottonView;

@end

@implementation CZWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //中间View
    CZWMiddleView *view = [CZWMiddleView MiddleLogView];
   
    CZWMiddleView *twoView = [CZWMiddleView MiddleLogTwoView];
    //下面View
    CZWFastLogin *login = [CZWFastLogin fastLogin];
    
    [self.bottonView addSubview:login];
    
    NSLog(@"%@",NSStringFromCGRect(twoView.frame));
    [self.middleView addSubview:view];
    [self.middleView addSubview:twoView];
    
    
}

- (IBAction)Xbutton {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)registerButton:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.leftMiddle.constant = -CZWwidth;
    [UIView animateWithDuration:0.25 animations:^{
      [self.view layoutIfNeeded];
    }];
    if (!sender.selected) {
        self.leftMiddle.constant = 0;
        [UIView animateWithDuration:0.25 animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CZWMiddleView *view = self.middleView.subviews[0];
     view.frame = CGRectMake(0, 0, CZWwidth, self.middleView.bs_height);
    
    CZWMiddleView *twoView = self.middleView.subviews[1];
    twoView.frame = CGRectMake(CZWwidth,0, CZWwidth, self.middleView.bs_height);
    
    CZWFastLogin *login = self.bottonView.subviews[0];
    login.frame = self.bottonView.bounds;
}


@end
