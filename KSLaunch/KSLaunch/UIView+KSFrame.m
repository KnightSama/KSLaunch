//
//  UIView+KSFrame.m
//  KSLibrary
//
//  Created by zhang on 15/12/16.
//  Copyright © 2015年 KamiSama. All rights reserved.
//

#import "UIView+KSFrame.h"

@implementation UIView (KSFrame)

/**
 *  @brief 获取view的位置坐标
 */
- (CGPoint)KSLocation{
    return self.frame.origin;
}

/**
 *  @brief 获取view的宽度
 */
- (CGFloat)KSWidth{
    return self.frame.size.width;
}

/**
 *  @brief 获取view的高度
 */
- (CGFloat)KSHeight{
    return self.frame.size.height;
}

/**
 *  @brief 获取View的中心坐标
 */
- (CGPoint)KSCenter{
    CGFloat centerX = self.KSLocation.x+(self.KSWidth/2.0);
    CGFloat centerY = self.KSLocation.y+(self.KSHeight/2.0);
    return CGPointMake(centerX, centerY);
}

/**
 *  @brief 设置view的Frame
 */
- (void)KSSetLocationX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)width Height:(CGFloat)height{
    [self setFrame:CGRectMake(x, y, width, height)];
}

/**
 *  @brief 设置view的X坐标
 */
- (void)KSSetLocationX:(CGFloat)x{
    [self setFrame:CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
}

/**
 *  @brief 设置view的Y坐标
 */
- (void)KSSetLocationY:(CGFloat)y{
    [self setFrame:CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height)];
}

/**
 *  @brief 设置view的宽度
 */
- (void)KSSetLocationWidth:(CGFloat)width{
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height)];
}

/**
 *  @brief 设置view的高度
 */
- (void)KSSetLocationHeight:(CGFloat)height{
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height)];
}

/**
 *  @brief 设置view的中心坐标
 */
- (void)KSSetCenterX:(CGFloat)x centerY:(CGFloat)y{
    CGFloat locationX = x - self.KSWidth/2.0;
    CGFloat locationY = y - self.KSHeight/2.0;
    [self KSSetLocationX:locationX];
    [self KSSetLocationY:locationY];
}
@end
