//
//  KSLaunchImageView.h
//  KSApplication
//
//  Created by zhang on 15/12/24.
//  Copyright © 2015年 KamiSama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSLaunchAnimate.h"

@interface KSLaunchImageView : UIImageView

/**
 *  @brief 初始化视图
 */
+ (instancetype)LaunchViewWithimageName:(NSString *)imageName frame:(CGRect)rect;

/**
 *  @brief 初始化视图
 */
+ (instancetype)LaunchViewWithimageUrl:(NSString *)imageUrl frame:(CGRect)rect;

/**
 *  @brief 加载视图并设置移除时间与动画
 */
- (void)loadLaunchViewDuration:(NSTimeInterval)duration animation:(KSLaunchAnimate *)loadAnimation removeAnimation:(KSLaunchAnimate *)removeAnimation compeletion:(void(^)(BOOL finish))compeletion;

@end
