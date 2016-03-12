//
//  UIImage+IOSVersion.h
//  MHWeiBo
//
//  Created by carrot on 16/3/12.
//  Copyright © 2016年 Carrot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (IOSVersion)

+ (UIImage*)imageWithName:(NSString*)name;
+ (UIImage *)resizedImageWithName:(NSString *)name;
@end
