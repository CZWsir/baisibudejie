//
//  CZWMainTabBar.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/18.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWMainTabBar.h"
#import "UIView+bs_frame.h"
@interface CZWMainTabBar()
@property(nonatomic,weak)UIButton *btn;
@end
@implementation CZWMainTabBar
- (UIButton *)btn
{
    
    if (!_btn) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [btn sizeToFit];
        _btn = btn;
       [self addSubview:self.btn];
    }
    return _btn;
}
//- (void)awakeFromNib
//{
//    [super awakeFromNib];

//}
- (void)layoutSubviews
{
    [super layoutSubviews];

    NSInteger count = self.items.count + 1;
    CGFloat distance = self.bounds.size.width / count;
    int number = 0;
    for (UIView *view in self.subviews) {
    if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
        view.frame = CGRectMake(number * distance, 0, distance, self.bounds.size.height);
        number++;
        if (number == 2) {
            number++;
        }
        }
    }
    self.btn.frame = CGRectMake(2 * distance, 0, distance,self.bounds.size.height);
    
}

@end
