//
//  UIImage+KSLaunchImage.m
//  KSApplication
//
//  Created by zhang on 15/12/24.
//  Copyright © 2015年 KamiSama. All rights reserved.
//

#import "UIImage+KSLaunchImage.h"

@implementation UIImage (KSLaunchImage)

/**
 *  @brief 获得App进入时的过渡图片
 */
+ (UIImage *)launchImage{
    NSString *viewOrientation = @"Portrait";
    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        viewOrientation = @"Landscape";
    }
    NSString *launchImageName = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    CGSize viewSize = [[UIApplication sharedApplication].windows firstObject].bounds.size;
    for (NSDictionary* dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            launchImageName = dict[@"UILaunchImageName"];
        }
    }
    return [UIImage imageNamed:launchImageName];
}

@end
