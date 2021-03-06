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
#import "UIImage+IOSVersion.h"
#import "MHNavigationController.h"
#import "MHWriteMessageController.h"


@interface MHTabBarController () < MHTabBarDelegate, MHWriteMessageDelegate>

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
    myTabBar.delegate = self;
    
    myTabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:myTabBar];
    self.myTabBar = myTabBar;

    //     toolbar 设置透明
    //    self.tabBar.tintColor = [UIColor clearColor];
    //    self.tabBar.barTintColor = [UIColor clearColor];
    //    self.tabBar.backgroundImage = [UIImage imageNamed:@"sss"];
    //    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1);
    //    UIGraphicsBeginImageContext(rect.size);
    //    CGContextRef context = UIGraphicsGetCurrentContext();
    //    CGContextSetFillColorWithColor(context,[UIColor clearColor].CGColor);
    //    CGContextFillRect(context, rect);
    //    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    //    self.tabBar.shadowImage = img;
    //    myTabBar.backgroundColor = [UIColor clearColor];
}

- (void)setupAllChildControllers{
    MHHomeViewController* home = [[MHHomeViewController alloc] init];
    [self setupChildControllers:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    MHMessageViewController* message = [[MHMessageViewController alloc] init];
    message.tabBarItem.badgeValue = @"99+";
    [self setupChildControllers:message title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    MHDiscoverViewController* discover = [[MHDiscoverViewController alloc] init];
    discover.tabBarItem.badgeValue = @"1";
    [self setupChildControllers:discover title:@"广场" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    MHMeViewController* me = [[MHMeViewController alloc] init];
    me.tabBarItem.badgeValue = @"20";
    [self setupChildControllers:me title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
}

- (void)setupChildControllers:(UIViewController*)controller title:(NSString*)title image:(NSString*)image selectedImage:(NSString*)selectedImage{
    MHNavigationController* nav = [[MHNavigationController alloc] initWithRootViewController:controller];
    
    controller.title = title;
    controller.tabBarItem.selectedImage = [UIImage imageWithName:selectedImage];
    controller.tabBarItem.image = [UIImage imageWithName:image];
    
    [self addChildViewController:nav];
    
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

- (void)tabBar:(MHTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from To:(NSInteger)to{
    [self setSelectedIndex:to];
}


- (void)tabBar:(MHTabBar *)tabBar didClickPlusButton:(UIButton *)button{
//    [self presentModalViewController:vc animated:YES];

    MHWriteMessageController* vc = [[MHWriteMessageController alloc]init];
    vc.delegate = self;
    MHNavigationController* nav = [[MHNavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:^{
        NSLog(@"present");
    }];
}

#pragma mark - MHWriteMessageDelegate
- (void)writeMessageSend:(NSDictionary *)dict{

}
- (void)writeMessageCancel{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"dismiss");
    }];
}

@end
