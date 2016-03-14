//
//  MHTitleButton.m
//  MHWeiBo
//
//  Created by carrot on 16/3/15.
//  Copyright © 2016年 Carrot. All rights reserved.
//

#import "MHTitleButton.h"

#define  MHTitleButtonImageW 30
@implementation MHTitleButton

+ (instancetype)titleButton{
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 高亮的时候不要自动调整图标
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:19];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        // 背景
        [self setBackgroundImage:[UIImage resizedImageWithName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = 0;
    CGFloat titleX = 0;
    CGFloat titleW = contentRect.size.width - MHTitleButtonImageW;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageY = 0;
    CGFloat imageW = MHTitleButtonImageW;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}
@end
