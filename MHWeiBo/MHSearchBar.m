//
//  MHSearchBar.m
//  MHWeiBo
//
//  Created by carrot on 16/3/15.
//  Copyright © 2016年 Carrot. All rights reserved.
//

#import "MHSearchBar.h"

@implementation MHSearchBar

+ (instancetype)searchBar{
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.background = [UIImage resizedImageWithName:@"searchbar_textfield_background"];
        // 左边的放大镜图标
        UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
        iconView.contentMode = UIViewContentModeCenter;
        self.leftView = iconView;
        self.leftViewMode = UITextFieldViewModeAlways;

        // 字体
        self.font = [UIFont systemFontOfSize:13];

        // 右边的清除按钮
        self.clearButtonMode = UITextFieldViewModeAlways;

        // 设置提醒文字
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"搜索" attributes:attrs];

        // 设置键盘右下角按钮的样式
        self.returnKeyType = UIReturnKeySearch;
        self.enablesReturnKeyAutomatically = YES;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];

    // 设置左边图标的frame
    self.leftView.frame = CGRectMake(0, 0, 30, self.frame.size.height);
}

@end

