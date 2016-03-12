//
//  UIImage+IOSVersion.m
//  MHWeiBo
//
//  Created by carrot on 16/3/12.
//  Copyright © 2016年 Carrot. All rights reserved.
//


#import "UIImage+IOSVersion.h"

@implementation UIImage (IOSVersion)

+ (UIImage*)imageWithName:(NSString*)name{
    if (MHiOS7) {
        NSString* imageName = [NSString stringWithFormat:@"%@_os7",name];

        UIImage* image = [UIImage imageNamed:imageName];
        if (!image) {
            image = [UIImage imageNamed:name];
        }
        return image;
    }
    return [UIImage imageNamed:name];
}

+ (UIImage *)resizedImageWithName:(NSString *)name
{
    UIImage *image = [self imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
@end
