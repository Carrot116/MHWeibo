//
//  UIBarButtonItem+IconButton.h
//  MHWeiBo
//
//  Created by carrot on 16/3/14.
//  Copyright © 2016年 Carrot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (IconButton)
+ (UIBarButtonItem*)barButtonImage:(NSString*)image selectImage:(NSString*)selImage taget:(id)target action:(SEL)action;
@end
