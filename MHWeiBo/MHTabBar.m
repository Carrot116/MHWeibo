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
@property (nonatomic, weak) UIButton* plusButton;
@property (nonatomic, weak) UIImageView* backImageView;
@end

@implementation MHTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        if (!MHiOS7) { // 非iOS7下,设置tabbar的背景
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
        }
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sss"]];
        [self addSubview:imageView];
        self.backImageView = imageView;
        [self addPlusButton];
    }
    return self;
}

- (void)addPlusButton{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateSelected];
    
    button.frame = CGRectMake(0, 0, button.currentBackgroundImage.size.width, button.currentBackgroundImage.size.height);
    self.plusButton = button;
    [self addSubview:button];
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
    CGRect rcBound = self.bounds;
    self.backImageView.frame = rcBound;
    
    CGPoint center = CGPointZero;
    center.x = rcBound.size.width * 0.5;
    center.y = rcBound.size.height * 0.5;
    self.plusButton.center = center;
    
    CGRect rcPlusButton = self.plusButton.frame;

    CGFloat width = (rcFrame.size.width - rcPlusButton.size.width) / self.barButtonItems.count;
    CGFloat height = rcFrame.size.height * 0.85;
    for (int i = 0; i < self.barButtonItems.count; i++) {
        CGFloat xStart = width * i;
        CGFloat yStart = rcFrame.size.height * 0.15;
        if (i >= self.barButtonItems.count / 2 ) {
            xStart += rcPlusButton.size.width;
        }
        [self.barButtonItems[i] setFrame:CGRectMake(xStart, yStart, width, height)];
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
