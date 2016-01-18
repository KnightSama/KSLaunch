//
//  KSLaunchAnimate.h
//  KSApplication
//
//  Created by zhang on 15/12/24.
//  Copyright © 2015年 KamiSama. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LoadAnimate) {
    LoadAnimateShow,
    LoadAnimatePop,
};

typedef NS_ENUM(NSUInteger, RemoveAnimate) {
    RemoveAnimateHide,
    RemoveAnimatePageUp,
};

typedef void(^animate)(UIView *view);
typedef void(^loadAnimate)(UIView *view);
typedef void(^removeAnimate)(UIView *view,void(^compelete)(BOOL finish));

@interface KSLaunchAnimate : NSObject

/**
 *  @brief 加载动画的Block
 */
@property(nonatomic,copy) loadAnimate loadAnimateBlock;

/**
 *  @brief 移除动画的Block
 */
@property(nonatomic,copy) removeAnimate removeAnimateBlock;

/**
 *  @brief 通过自定义动画起始状态Block初始化加载动画
 */
+ (instancetype)createLoadAnimateDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options startState:(animate)start finishState:(animate)finish;

/**
 *  @brief 通过自定义动画起始状态Block初始化移除动画
 */
+ (instancetype)createRemoveAnimateDuration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options startState:(animate)start finishState:(animate)finish;

/**
 *  @brief 通过自定义过渡动画初始化移除视图
 */
+ (instancetype)createRemoveAnimateDuration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options;

/**
 *  @brief 获取一个预设的添加动画
 */
+ (instancetype)loadAnimateWithStyle:(LoadAnimate)style;

/**
 *  @brief 获取一个预设的移除动画
 */
+ (instancetype)removeAnimateWithStyle:(RemoveAnimate)style;
@end
