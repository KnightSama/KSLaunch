//
//  KSLaunchImageView.m
//  KSApplication
//
//  Created by zhang on 15/12/24.
//  Copyright © 2015年 KamiSama. All rights reserved.
//

#import "KSLaunchImageView.h"
#import "UIImage+KSLaunchImage.h"

#define KS_Window [[UIApplication sharedApplication].windows firstObject]

typedef void(^compelete)(BOOL finish);

@interface KSLaunchImageView ()

/**
 *  @brief 要动画加载的图片的名字
 */
@property(nonatomic,strong) NSString *imageName;

/**
 *  @brief 要动画加载的图片的地址
 */
@property(nonatomic,strong) NSString *imageUrl;

/**
 *  @brief 移除视图时的动画
 */
@property(nonatomic,strong) KSLaunchAnimate *removeAnimate;

/**
 *  @brief 完成时执行的Block
 */
@property(nonatomic,copy) compelete compeletion;

/**
 *  @brief 广告视图的大小
 */
@property(nonatomic,assign) CGRect rect;

@end

@implementation KSLaunchImageView

/**
 *  @brief 初始化视图
 */
+ (instancetype)LaunchViewWithimageName:(NSString *)imageName frame:(CGRect)rect{
    UIImage *launchImage = [UIImage launchImage];
    KSLaunchImageView *launchView = [[self alloc]initWithImage:launchImage];
    launchView.imageName = imageName;
    launchView.frame = KS_Window.bounds;
    launchView.contentMode = UIViewContentModeScaleToFill;
    launchView.rect = rect;
    return launchView;
}

/**
 *  @brief 初始化视图
 */
+ (instancetype)LaunchViewWithimageUrl:(NSString *)imageUrl frame:(CGRect)rect{
    UIImage *launchImage = [UIImage launchImage];
    KSLaunchImageView *launchView = [[self alloc]initWithImage:launchImage];
    launchView.imageUrl = imageUrl;
    launchView.frame = KS_Window.bounds;
    launchView.contentMode = UIViewContentModeScaleToFill;
    launchView.rect = rect;
    return launchView;
}

/**
 *  @brief 加载视图并设置移除时间与动画
 */
- (void)loadLaunchViewDuration:(NSTimeInterval)duration animation:(KSLaunchAnimate *)loadAnimation removeAnimation:(KSLaunchAnimate *)removeAnimation compeletion:(void(^)(BOOL finish))compeletion{
    KS_Window.hidden = NO;
    [KS_Window addSubview:self];
    [KS_Window bringSubviewToFront:self];
    self.removeAnimate = removeAnimation;
    self.compeletion = compeletion;
    [self performSelector:@selector(removeView) withObject:nil afterDelay:duration];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.rect];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:imageView];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.imageUrl) {
            NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.imageUrl]];
            if (data) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    imageView.image = [UIImage imageWithData:data];
                    loadAnimation.loadAnimateBlock(imageView);
                });
            }
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                imageView.image = [UIImage imageNamed:self.imageName];
                loadAnimation.loadAnimateBlock(imageView);
            });
        }
    });
}

/**
 *  @brief 移除视图的方法
 */
- (void)removeView{
    self.removeAnimate.removeAnimateBlock(self,self.compeletion);
}

@end
