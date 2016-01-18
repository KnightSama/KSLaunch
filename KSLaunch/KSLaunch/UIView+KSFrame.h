//
//  UIView+KSFrame.h
//  KSLibrary
//
//  Created by zhang on 15/12/16.
//  Copyright © 2015年 KamiSama. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KSFrame)

/**
 *  @brief 获取view的位置坐标
 */
- (CGPoint)KSLocation;

/**
 *  @brief 获取view的宽度
 */
- (CGFloat)KSWidth;

/**
 *  @brief 获取view的高度
 */
- (CGFloat)KSHeight;

/**
 *  @brief 获取View的中心坐标
 */
- (CGPoint)KSCenter;

/**
 *  @brief 设置view的Frame
 */
- (void)KSSetLocationX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)width Height:(CGFloat)height;

/**
 *  @brief 设置view的X坐标
 */
- (void)KSSetLocationX:(CGFloat)x;

/**
 *  @brief 设置view的Y坐标
 */
- (void)KSSetLocationY:(CGFloat)y;

/**
 *  @brief 设置view的宽度
 */
- (void)KSSetLocationWidth:(CGFloat)width;

/**
 *  @brief 设置view的高度
 */
- (void)KSSetLocationHeight:(CGFloat)height;

/**
 *  @brief 设置view的中心坐标
 */
- (void)KSSetCenterX:(CGFloat)x centerY:(CGFloat)y;
@end
