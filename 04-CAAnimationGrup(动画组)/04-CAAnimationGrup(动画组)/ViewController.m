//
//  ViewController.m
//  04-CAAnimationGrup(动画组)
//
//  Created by qinglinfu on 16/1/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#define TSreenWeight [UIScreen mainScreen].bounds.size.width
#define TSreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *aniView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self addAnimationGroup];
}

- (void)addAnimationGroup
{
    CAAnimationGroup *aniGroup = [CAAnimationGroup animation];
    aniGroup.duration = 3;
    aniGroup.repeatCount = HUGE_VALF;    
    aniGroup.animations = @[[self rotation],[self scale],[self opacity],[self cornerRadius],[self keyAnimation]];
    [self.aniView.layer addAnimation:aniGroup forKey:nil];
}

- (CABasicAnimation *)rotation
{
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.duration = 3;
    rotation.byValue = @(2 * M_PI);
    return rotation;
}

- (CABasicAnimation *)scale
{
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.duration = 3;
    scale.byValue = @2;
    return scale;
}

- (CABasicAnimation *)opacity
{
    CABasicAnimation *opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacity.duration = 3;
    opacity.byValue = @-1;
    return opacity;
}

- (CABasicAnimation *)cornerRadius
{
    CABasicAnimation *cornerRadius = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    cornerRadius.duration = 3;
    cornerRadius.byValue = @75;
    return cornerRadius;
}

- (CAKeyframeAnimation *)keyAnimation
{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.duration = 3;
    keyAnimation.removedOnCompletion = NO;
    keyAnimation.fillMode = kCAFillModeForwards;
    
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(0, TSreenHeight/2)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(TSreenWeight/2, 0)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(TSreenWeight, TSreenHeight/2)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(TSreenWeight/2, TSreenHeight)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(0, TSreenHeight/2)];
    NSArray *values = @[value1,value2,value3,value4,value5];
    keyAnimation.values = values;
    keyAnimation.calculationMode = kCAAnimationCubic;
    
    return keyAnimation;
}

@end
