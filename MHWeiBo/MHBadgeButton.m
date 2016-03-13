//
//  MHBadgeButton.m
//  MHWeiBo
//
//  Created by carrot on 16/3/13.
//  Copyright © 2016年 Carrot. All rights reserved.
//

#import "MHBadgeButton.h"

@implementation MHBadgeButton

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.hidden = YES;
        self.userInteractionEnabled = NO;
        [self setBackgroundImage:[UIImage resizedImageWithName:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:11];
    }
    return self;
}

- (void)setBadge:(NSString *)badge{
    _badge = [badge copy];

    self.hidden = (_badge == nil);
    [self resizeSelf];
}

- (void)resizeSelf{
    if (self.hidden) {
        return;
    }
    // 设置文字
    [self setTitle:self.badge forState:UIControlStateNormal];

    // 设置frame
    CGRect frame = self.frame;
    CGFloat badgeH = self.currentBackgroundImage.size.height;
    CGFloat badgeW = self.currentBackgroundImage.size.width;
    if (self.badge.length > 1) {
        // 文字的尺寸
#ifdef __IPHONE_7_0
        CGSize badgeSize = [self.badge sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
#else
        CGSize badgeSize = [self.badge sizeWithFont:self.titleLabel.font];
#endif
        badgeW = badgeSize.width + 10;
    }
    frame.size.width = badgeW;
    frame.size.height = badgeH;
    self.frame = frame;
}

@end
