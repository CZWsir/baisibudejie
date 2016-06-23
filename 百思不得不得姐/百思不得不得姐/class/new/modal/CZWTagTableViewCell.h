//
//  CZWTagTableViewCell.h
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/22.
//  Copyright © 2016年 百度. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZWSubTagItem;
@interface CZWTagTableViewCell : UITableViewCell

@property (nonatomic,strong)CZWSubTagItem *item;
+ (instancetype)tagTableViewCell;
@end
