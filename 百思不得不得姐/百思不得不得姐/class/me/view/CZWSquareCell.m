//
//  CZWSquareCell.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/23.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWSquareCell.h"
#import <UIImageView+WebCache.h>
#import "CZWMeItem.h"
@interface CZWSquareCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *lable;

@end
@implementation CZWSquareCell

- (void)setItem:(CZWMeItem *)item
{
    _item = item;
    self.lable.text = item.name;
//    NSLog(@"%@",item.url);
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:item.icon] placeholderImage:nil];
}

@end
