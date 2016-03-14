//
//  MHTabBar.h
//  MHWeiBo
//
//  Created by Carrot on 16/3/12.
//  Copyright © 2016年 Carrot. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MHTabBar;

@protocol MHTabBarDelegate <NSObject>
- (void)tabBar:(MHTabBar*)tabBar didSelectedButtonFrom:(NSInteger)from To:(NSInteger)to;

- (void)tabBar:(MHTabBar *)tabBar didClickPlusButton:(UIButton*)button;
@end


@interface MHTabBar : UIView

@property (nonatomic, weak) id<MHTabBarDelegate> delegate;

- (void)addTabButtonWithTabBarItem:(UITabBarItem*)item;
@end
