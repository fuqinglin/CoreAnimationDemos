//
//  TSImageView.m
//  04-KeyFrameAnimation_Demo
//
//  Created by qinglinfu on 15/9/4.
//  Copyright (c) 2015年 十安科技. All rights reserved.
//

#define TSreenWeight [UIScreen mainScreen].bounds.size.width
#define TSreenHeight [UIScreen mainScreen].bounds.size.height


#import "TSAnimationClass.h"

@implementation TSAnimationClass

#pragma mark - 关键帧动画--移动
+ (CAKeyframeAnimation *)positionAnimationDuration:(CFTimeInterval)duration withValueCount:(int)count
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = 10;
    
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(0, TSreenHeight/2)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(TSreenWeight/2, 0)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(TSreenWeight, TSreenHeight/2)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(TSreenWeight/2, TSreenHeight)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(0, TSreenHeight/2)];
    NSArray *values = @[value1,value2,value3,value4,value5];
    animation.values = values;
//    animation.keyTimes = @[@0,@.3,@.6,@.7,@1];
    animation.calculationMode = kCAAnimationCubic;
    
//    for (int i = 0; i < count ; i++) {
//        
//        NSValue *value = [NSValue valueWithCGPoint:[self randomPoint]];
//        [values addObject:value];
//    }
    // 设置多个点
    
    return animation;
}


#pragma mark - keyPath动画

+ (CAKeyframeAnimation *)pathAnimationDuration:(CFTimeInterval)duration withPath:(CGPathRef)path
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.path = path;
    animation.repeatCount = HUGE_VALF;
    return animation;
}


+ (CGPoint)randomPoint
{
    float x = arc4random_uniform(TSreenWeight);
    float y = arc4random_uniform(TSreenHeight);
    return CGPointMake(x, y);
}

@end
