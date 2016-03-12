//
//  MHTabBarButton.m
//  MHWeiBo
//
//  Created by Carrot on 16/3/12.
//  Copyright © 2016年 Carrot. All rights reserved.
//

#import "MHTabBarButton.h"
#import "MHBadgeButton.h"

// 图标的比例
#define MHTabBarButtonImageRatio 0.65

// 按钮的默认文字颜色
#define  MHTabBarButtonTitleColor (MHiOS7 ? [UIColor blackColor] : [UIColor whiteColor])
// 按钮的选中文字颜色
#define  MHTabBarButtonTitleSelectedColor (MHiOS7 ? MHColor(234, 103, 7) : MHColor(248, 139, 0))

@interface MHTabBarButton()
@property (nonatomic, weak) MHBadgeButton* badgeButton;
@end

@implementation MHTabBarButton

- (void)setHighlighted:(BOOL)highlighted{

}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 图标居中
        self.imageView.contentMode = UIViewContentModeCenter;
        // 文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        // 文字颜色
        [self setTitleColor:MHTabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:MHTabBarButtonTitleSelectedColor forState:UIControlStateSelected];

        if (!MHiOS7) { // 非iOS7下,设置按钮选中时的背景
            [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
        };

        MHBadgeButton* button = [[MHBadgeButton alloc] init];
        [self addSubview:button];
//        button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        self.badgeButton = button;
    }
    return self;
}

- (void)dealloc{
    [self removeAllObservers];
}
- (void)removeAllObservers{
    if (_item == nil) {
        return;
    }
    [self removeObserver:_item forKeyPath:@"title" ];
    [self removeObserver:_item forKeyPath:@"image" ];
    [self removeObserver:_item forKeyPath:@"selectedImage" ];
    [self removeObserver:_item forKeyPath:@"badge"];
}

- (void)addObserver{
    [self addObserver:_item forKeyPath:@"title" options:0 context:nil];
    [self addObserver:_item forKeyPath:@"image" options:0 context:nil];
    [self addObserver:_item forKeyPath:@"selectedImage" options:0 context:nil];
    [self addObserver:_item forKeyPath:@"badge" options:0 context:nil];
}

- (void)setItem:(UITabBarItem*)item{
    if (_item == item) {
        return  ;
    }
    [self removeAllObservers];
    _item = item;
    [self addObserver];

    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];

    [self.badgeButton setBadge:self.item.badgeValue];
    [self setNeedsLayout];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect rcFrame = self.frame;
    CGRect rcBadge = self.badgeButton.frame;
    CGFloat centerX = rcFrame.size.width * 0.75;
    CGFloat centerY = rcBadge.size.height * 0.5 + 3;
    self.badgeButton.center = CGPointMake(centerX, centerY);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat height = contentRect.size.height;
    return CGRectMake(0, height * MHTabBarButtonImageRatio, contentRect.size.width, height * (1 - MHTabBarButtonImageRatio));
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
      return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height * MHTabBarButtonImageRatio);
}

@end
