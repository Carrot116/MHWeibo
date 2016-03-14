//
//  UIBarButtonItem+IconButton.m
//  MHWeiBo
//
//  Created by carrot on 16/3/14.
//  Copyright © 2016年 Carrot. All rights reserved.
//

#import "UIBarButtonItem+IconButton.h"

@implementation UIBarButtonItem (IconButton)

+ (UIBarButtonItem*)barButtonImage:(NSString*)image selectImage:(NSString*)selImage taget:(id)target action:(SEL)action{

    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageWithName:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageWithName:selImage] forState:UIControlStateHighlighted];
    button.bounds = CGRectMake(0, 0, button.currentImage.size.width, button.currentImage.size.height);

    return [[UIBarButtonItem alloc]initWithCustomView:button];
}
@end
