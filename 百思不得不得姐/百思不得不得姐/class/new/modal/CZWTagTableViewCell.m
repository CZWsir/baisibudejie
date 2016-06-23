//
//  CZWTagTableViewCell.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/22.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWTagTableViewCell.h"
#import "CZWSubTagItem.h"
#import <UIImageView+WebCache.h>
#import <SDWebImageManager.h>
@interface CZWTagTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *countLable;
@end
@implementation CZWTagTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.icon.layer.cornerRadius = self.icon.bounds.size.width * 0.5;
//    self.icon.layer.masksToBounds = YES;
}
+ (instancetype)tagTableViewCell
{
    CZWTagTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
    return cell;
}
- (void)setItem:(CZWSubTagItem *)item
{
    _item = item;
    self.nameLable.text = item.theme_name;
    //处理tableView下标文字的显示
    NSString *str = item.sub_number;
    if (str.floatValue >= 10000) {
        self.countLable.text = [NSString stringWithFormat:@"%0.1f万人订阅",str.floatValue / 10000];
    }
    NSURL *url = [NSURL URLWithString:item.image_list];
    
//    [[SDWebImageManager sharedManager]downloadImageWithURL:url options:SDWebImageRetryFailed progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//
//    }];
    
    [self.icon sd_setImageWithPreviousCachedImageWithURL:url placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] options:SDWebImageRetryFailed progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image == nil)return ;
                UIGraphicsBeginImageContext(image.size);
                UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
                [path addClip];
                [image drawAtPoint:CGPointZero];
               image = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                self.icon.image = image;
    }];

    
}
//- (void)setFrame:(CGRect)frame
//{
//    CGRect rect = frame;
//    rect.size.height -= 1;
//    frame = rect;
//    [super setFrame:frame];
//}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
