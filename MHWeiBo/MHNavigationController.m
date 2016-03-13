//
//  MHNavigationController.m
//  MHWeiBo
//
//  Created by Carrot on 16/3/13.
//  Copyright © 2016年 Carrot. All rights reserved.
//

#import "MHNavigationController.h"

@implementation MHNavigationController

+ (void)initialize{
    [self setupNavBar];
    
    [self setupNavBarButtonItem];
}

+ (void)setupNavBar{
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    if (!MHiOS7) {
#ifdef __IPHONE_7_0
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
#else
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
#endif
        [navBar setBackgroundImage:[UIImage imageWithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    }
}

+ (void)setupNavBarButtonItem{
    UIBarButtonItem* barItem = [UIBarButtonItem appearance];
    
    // 设置背景  ios7 及以上不用设置
    if (!MHiOS7) {
        
        [barItem setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [barItem setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [barItem setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    }
    
    // 设置文字属性
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:MHiOS7 ? 14 : 11];
    NSShadow* shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeZero;
    dict[NSShadowAttributeName] = shadow;
    dict[NSForegroundColorAttributeName] = MHiOS7 ? [UIColor orangeColor] : [UIColor grayColor];
    [barItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    [barItem setTitleTextAttributes:dict forState:UIControlStateHighlighted];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
@end
