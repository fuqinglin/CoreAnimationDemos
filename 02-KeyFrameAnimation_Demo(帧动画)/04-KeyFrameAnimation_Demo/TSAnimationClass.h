//
//  TSImageView.h
//  04-KeyFrameAnimation_Demo
//
//  Created by qinglinfu on 15/9/4.
//  Copyright (c) 2015年 十安科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSAnimationClass : UIImageView

/**
 *  关键帧移动position
 *
 *  @param duration  动画时间
 *  @param count     关键帧的个数
 *
 *  @return          CAKeyframeAnimation
 */
+ (CAKeyframeAnimation *)positionAnimationDuration:(CFTimeInterval)duration withValueCount:(int)count;


/**
 *  path 路径动画
 *
 *  @param duration   动画时间
 *  @param path       动画路径
 *
 *  @return           CAKeyframeAnimation
 */
+ (CAKeyframeAnimation *)pathAnimationDuration:(CFTimeInterval)duration withPath:(CGPathRef)path;

@end