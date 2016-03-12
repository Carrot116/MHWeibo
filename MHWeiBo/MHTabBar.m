//
//  MHTabBar.m
//  MHWeiBo
//
//  Created by Carrot on 16/3/12.
//  Copyright © 2016年 Carrot. All rights reserved.
//

#import "MHTabBar.h"
#import "MHTabBarController.h"
#import "MHTabBarButton.h"

@interface MHTabBar()

@property (nonatomic, strong) NSMutableArray* barButtonItems;
@property (nonatomic, weak) MHTabBarButton* selectedButton;
@end

@implementation MHTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        if (!MHiOS7) { // 非iOS7下,设置tabbar的背景
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
        }
    }
    return self;
}

- (NSMutableArray*)barButtonItems{
    if (_barButtonItems == nil) {
        _barButtonItems = [NSMutableArray array];
    }
    return _barButtonItems;
}

- (void)addTabButtonWithTabBarItem:(UITabBarItem*)item{
    MHTabBarButton* button = [[MHTabBarButton alloc]init];

    button.item = item;
    [self addSubview:button];    // 3.监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];

    button.tag = self.barButtonItems.count;
    [self.barButtonItems addObject:button];
    if (self.barButtonItems.count == 1) {
        [self buttonClick:button];
    }
}

- (void)layoutSubviews{
    CGRect rcFrame = self.frame;

    CGFloat width = rcFrame.size.width / self.barButtonItems.count;
    CGFloat height = rcFrame.size.height;
    for (int i = 0; i < self.barButtonItems.count; i++) {
        [self.barButtonItems[i] setFrame:CGRectMake(width * i, 0, width, height)];
    }
}

- (void)buttonClick:(MHTabBarButton*)sender{
    [self.selectedButton setSelected:NO];
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:To:)]) {
            [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag To:sender.tag];
        }
    }
    self.selectedButton = sender;
    [self.selectedButton setSelected:YES];
}
@end
