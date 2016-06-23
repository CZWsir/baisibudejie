//
//  CZWTextField.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/22.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWTextField.h"

@implementation CZWTextField

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.tintColor = [UIColor whiteColor];
    
    [self addTarget:self action:@selector(textEditBegin) forControlEvents:UIControlEventEditingDidBegin];
   

    [self addTarget:self action:@selector(textEditEnd) forControlEvents:UIControlEventEditingDidEnd ];
   
    
}
- (void)textEditBegin
{
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    placeholderLabel.textColor = [UIColor whiteColor];
//    NSAttributedString *string = [[NSAttributedString alloc]initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    self.attributedPlaceholder = string;
    
}
- (void)textEditEnd
{
//    NSAttributedString *string = [[NSAttributedString alloc]initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]}];
//    self.attributedPlaceholder = string;
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    placeholderLabel.textColor = [UIColor lightGrayColor];
}
@end
