//
//  CZWMiddleView.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/22.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWMiddleView.h"
@interface CZWMiddleView()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end
@implementation CZWMiddleView

+ (instancetype)MiddleLogView
{
    CZWMiddleView *view =[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    return view;
}
+ (instancetype)MiddleLogTwoView
{
    CZWMiddleView *view = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
    return view;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    UIImage *image = self.loginButton.currentBackgroundImage;
   image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.5, image.size.width * 0.5, image.size.height * 0.5 -1, image.size.width * 0.5 - 1) resizingMode:UIImageResizingModeTile];
    [self.loginButton setBackgroundImage:image forState:UIControlStateNormal];
}
@end
