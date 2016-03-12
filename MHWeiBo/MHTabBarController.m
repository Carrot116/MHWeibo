//
//  MHTabBarController.m
//  MHWeiBo
//
//  Created by Carrot on 16/3/12.
//  Copyright © 2016年 Carrot. All rights reserved.
//

#import "MHTabBarController.h"
#import "MHTabBar.h"
#import "MHDiscoverViewController.h"
#import "MHMessageViewController.h"
#import "MHMeViewController.h"
#import "MHHomeViewController.h"

@interface MHTabBarController ()

@property (nonatomic, weak) MHTabBar* myTabBar;
@end

@implementation MHTabBarController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self setupTabBar];
    [self setupAllChildControllers];
}

- (void)setupTabBar{
    MHTabBar* myTabBar = [[MHTabBar alloc] init];
    myTabBar.backgroundColor = [UIColor redColor];
    
    myTabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:myTabBar];
    self.myTabBar = myTabBar;
}

- (void)setupAllChildControllers{
    MHHomeViewController* home = [[MHHomeViewController alloc] init];
    [self setupChildControllers:home title:@"首页" image:nil selectedImage:nil];
    
    MHMessageViewController* message = [[MHMessageViewController alloc] init];
    [self setupChildControllers:message title:@"消息" image:nil selectedImage:nil];
    
    MHDiscoverViewController* discover = [[MHDiscoverViewController alloc] init];
    [self setupChildControllers:discover title:@"广场" image:nil selectedImage:nil];
    
    MHMeViewController* me = [[MHMeViewController alloc] init];
    [self setupChildControllers:me title:@"我" image:nil selectedImage:nil];
}

- (void)setupChildControllers:(UIViewController*)controller title:(NSString*)title image:(NSString*)image selectedImage:(NSString*)selectedImage{
    controller.title = title;
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    controller.tabBarItem.image = [UIImage imageNamed:image];
    
    [self addChildViewController:controller];
    
    [self.myTabBar addTabButtonWithTabBarItem:controller.tabBarItem];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for (UIView* view in self.tabBar.subviews){
        if ([view isKindOfClass:[UIControl class]]) {
            [view removeFromSuperview];
        }
    }
}

@end
