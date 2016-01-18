//
//  KSLaunchAnimate.m
//  KSApplication
//
//  Created by zhang on 15/12/24.
//  Copyright © 2015年 KamiSama. All rights reserved.
//

#import "KSLaunchAnimate.h"
#import "UIView+KSFrame.h"

#define KS_Window [[UIApplication sharedApplication].windows firstObject]

@implementation KSLaunchAnimate

/**
 *  @brief 通过自定义动画起始状态Block初始化加载动画
 */
+ (instancetype)createLoadAnimateDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options startState:(animate)start finishState:(animate)finish{
    KSLaunchAnimate *animate = [[self alloc]init];
    animate.loadAnimateBlock = ^(UIView *view){
        start(view);
        [UIView animateWithDuration:duration delay:delay options:options animations:^{
            finish(view);
        } completion:nil];
    };
    return animate;
}

/**
 *  @brief 通过自定义动画起始状态Block初始化移除动画
 */
+ (instancetype)createRemoveAnimateDuration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options startState:(animate)start finishState:(animate)finish{
    KSLaunchAnimate *animate = [[self alloc]init];
    animate.removeAnimateBlock = ^(UIView *view,void(^compelete)(BOOL finish)){
        start(view);
        [UIView animateWithDuration:duration delay:0 options:options animations:^{
            finish(view);
        } completion:^(BOOL finished) {
            if (compelete) {
                [view removeFromSuperview];
                compelete(finished);
            }
        }];
    };
    return animate;
}

/**
 *  @brief 通过自定义过渡动画初始化移除视图
 */
+ (instancetype)createRemoveAnimateDuration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options{
    KSLaunchAnimate *animate = [[self alloc]init];
    animate.removeAnimateBlock = ^(UIView *view,void(^compelete)(BOOL finish)){
        [UIView transitionFromView:view toView:KS_Window.rootViewController.view duration:duration options:options completion:^(BOOL finished) {
            if (compelete) {
                [view removeFromSuperview];
                compelete(finished);
            }
        }];
    };
    return animate;
}

/**
 *  @brief 获取一个预设的添加动画
 */
+ (instancetype)loadAnimateWithStyle:(LoadAnimate)style{
    switch (style) {
        case LoadAnimateShow: {
            return [self createLoadAnimateDuration:0.5 delay:0.3 options:UIViewAnimationOptionCurveLinear startState:^(UIView *view) {
                view.alpha = 0;
            } finishState:^(UIView *view) {
                view.alpha = 1;
            }];
        }
        case LoadAnimatePop: {
            __block CGRect rect;
            return [self createLoadAnimateDuration:0.5 delay:0.3 options:UIViewAnimationOptionCurveLinear startState:^(UIView *view) {
                rect = view.frame;
                CGPoint point = view.KSCenter;
                [view KSSetLocationWidth:0];
                [view KSSetLocationHeight:0];
                [view KSSetCenterX:point.x centerY:point.y];
            } finishState:^(UIView *view) {
                [view setFrame:rect];
            }];
        }
    }
}

/**
 *  @brief 获取一个预设的移除动画
 */
+ (instancetype)removeAnimateWithStyle:(RemoveAnimate)style{
    switch (style) {
        case RemoveAnimateHide: {
            return [self createRemoveAnimateDuration:0.5 options:UIViewAnimationOptionCurveLinear startState:^(UIView *view) {
            } finishState:^(UIView *view) {
                view.alpha = 0;
            }];
        }
        case RemoveAnimatePageUp: {
            return [self createRemoveAnimateDuration:1 options:UIViewAnimationOptionTransitionCurlUp];
        }
    }
}
@end
