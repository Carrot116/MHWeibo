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

@end

@implementation MHTabBar

- (void)addTabButtonWithTabBarItem:(UITabBarItem*)item{
    MHTabBarButton* button = [[MHTabBarButton alloc]init];
    
    button.item = item;
}
@end
