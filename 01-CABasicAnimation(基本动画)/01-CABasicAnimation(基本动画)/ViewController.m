//
//  ViewController.m
//  01-CABasicAnimation(基本动画)
//
//  Created by qinglinfu on 16/1/18.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *_aniView;
    
    BOOL _isRecover;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _aniView = [[UIView alloc] initWithFrame:CGRectMake(50, 100,150, 150)];
    _aniView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_aniView];
    
    
}

- (IBAction)animationAction:(UIButton *)sender {
    
    if (_isRecover){
        
        [self recoverAnimation];
        
    }else {
        
        // [self rotation];
        // [self scale];
        // [self translation];
         [self otherAnimation];
    }
 
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self pauseAnimation];
    _isRecover = YES;
}

// 暂停动画
- (void)pauseAnimation
{
   CFTimeInterval stopTime = [_aniView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    NSLog(@"%f",stopTime);
    _aniView.layer.timeOffset = stopTime;
    _aniView.layer.speed = 0.0;
    
}
// 恢复动画
- (void)recoverAnimation
{
    CFTimeInterval stopTime = _aniView.layer.timeOffset;
    NSLog(@"---%f",stopTime);
    _aniView.layer.timeOffset = 0;  // 重置动画的时间偏移
    _aniView.layer.speed = 1.0;     // 动画的速度，默认是1
    _aniView.layer.beginTime = 0;   // 将beginTime清0
    _aniView.layer.beginTime = [_aniView.layer convertTime:CACurrentMediaTime() fromLayer:nil] - stopTime;
    
    /* CACurrentMediaTime() 当前媒体时间
        在CA中,有一个Absolute Time(绝对时间)的概念,可以通过CACurrentMediaTime()获得,其实这个绝对时间就是将mach_absolute_time()转换成秒后的值.这个时间和系统的uptime有关,系统重启后CACurrentMediaTime()会被重置.
    */
}

// 旋转
- (void)rotation
{
    NSLog(@"%f",CACurrentMediaTime()); // 391839.565823, 当前媒体时间
    CABasicAnimation *animation = [CABasicAnimation animation];
    [animation setKeyPath:@"transform.rotation"];
    animation.fromValue = @0.0;             // 动画状态起始值
    animation.toValue = @(2* M_PI);         // 动画状态结束后的值
    //animation.byValue = @M_PI_4;          // 动画变化的值
    animation.duration = 2.5;               // 动画时间
    //animation.autoreverses = YES;         // 是否有恢复动画
    animation.repeatCount = HUGE_VALF;      // 重复次数
//    animation.removedOnCompletion = NO;   // 是否回到原始状态
//    animation.fillMode = kCAFillModeForwards;
    
    // 动画的速度变化
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [_aniView.layer addAnimation:animation forKey:@"ani_rotation"];

}

// 缩放
- (void)scale
{
  
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.byValue = @-1.0;
    animation.duration = 0.5;
    animation.autoreverses = YES;
    animation.repeatCount = HUGE_VALF;
    
    [_aniView.layer addAnimation:animation forKey:@"ani_scale"];
}
// 移动
- (void)translation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.byValue = @100;
    animation.duration = 0.5;
    animation.autoreverses = YES;
    animation.repeatCount = HUGE_VALF;
    
    [_aniView.layer addAnimation:animation forKey:@"ani_translation"];
}

- (void)otherAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.byValue = @-1;
    animation.duration = 0.5;
    animation.autoreverses = YES;
    animation.repeatCount = HUGE_VALF;
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation1.byValue = @-0.5;
    animation1.duration = 1;
    animation1.autoreverses = YES;
    animation1.repeatCount = HUGE_VALF;
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation2.fromValue = @75;
    animation2.toValue = @0;
    animation2.duration = 1;
    animation2.autoreverses = YES;
    animation2.repeatCount = HUGE_VALF;
    
    
    [_aniView.layer addAnimation:animation forKey:@"ani_opacity"];
    [_aniView.layer addAnimation:animation1 forKey:@"ani_scale"];
    [_aniView.layer addAnimation:animation2 forKey:@"ani_cornerRatius"];
    
}

@end
