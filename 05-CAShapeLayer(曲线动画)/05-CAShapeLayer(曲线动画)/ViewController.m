//
//  ViewController.m
//  05-CAShapeLayer(曲线动画)
//
//  Created by qinglinfu on 16/1/20.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CAShapeLayer *shapeLayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self drawAnimation];
}

- (void)drawAnimation
{
    
    // 1、创建绘图路径
    // UIBezierPath *path = [self pathOne];
    // UIBezierPath *path = [self pathTwo];
     UIBezierPath *path = [self pathThree];
    
    // 2、创建绘图图层
    
    if (!shapeLayer) {
        shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        shapeLayer.fillColor = nil;
        shapeLayer.strokeColor = [UIColor redColor].CGColor;
        shapeLayer.lineWidth = 3;
        [self.view.layer addSublayer:shapeLayer];
    }

    // 3、添加动画
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    [animation setKeyPath:@"strokeEnd"];
    //[animation setKeyPath:@"strokeStart"];
    animation.duration = 5;
    animation.fromValue = @0;
    animation.toValue = @1;
    
    [shapeLayer addAnimation:animation forKey:nil];
    
}

// 画图形
- (UIBezierPath *)pathOne
{
    self.view.layer.backgroundColor = [UIColor blackColor].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(100, 100) radius:50 startAngle:M_PI_2 endAngle:(5.0/2)* M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(100, 350)];
    [path moveToPoint:CGPointMake(100, 350)];
    [path addLineToPoint:CGPointMake(50, 400)];
    [path moveToPoint:CGPointMake(100, 350)];
    [path addLineToPoint:CGPointMake(150, 400)];
    [path moveToPoint:CGPointMake(50, 250)];
    [path addLineToPoint:CGPointMake(150, 250)];
    
    [path moveToPoint:CGPointMake(250, 160)];
    [path addArcWithCenter:CGPointMake(250, 100) radius:60 startAngle:M_PI_2 endAngle:(5.0/2)* M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(250, 160)];
    [path addLineToPoint:CGPointMake(250, 360)];
    [path moveToPoint:CGPointMake(250, 360)];
    [path addLineToPoint:CGPointMake(200, 400)];
    [path moveToPoint:CGPointMake(250, 360)];
    [path addLineToPoint:CGPointMake(300, 400)];
    [path moveToPoint:CGPointMake(200, 250)];
    [path addLineToPoint:CGPointMake(300, 250)];
    
    return path;
}

// 画折线图
- (UIBezierPath *)pathTwo
{
    float screenWidth = [UIScreen mainScreen].bounds.size.width;
    float screenHeight = [UIScreen mainScreen].bounds.size.height;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, screenHeight)];
    [path addLineToPoint:CGPointMake(screenWidth, screenHeight)];
    [path moveToPoint:CGPointMake(0, screenHeight)];
    [path addLineToPoint:CGPointMake(0, screenHeight/2)];
    
    [path moveToPoint:CGPointMake(0, screenHeight)];
    [path addLineToPoint:CGPointMake(50, screenHeight - 50)];
    [path addLineToPoint:CGPointMake(70, screenHeight - 30)];
    [path addLineToPoint:CGPointMake(90, screenHeight - 100)];
    [path addLineToPoint:CGPointMake(120, screenHeight - 90)];
    [path addLineToPoint:CGPointMake(140, screenHeight - 60)];
    [path addLineToPoint:CGPointMake(160, screenHeight - 110)];
    [path addLineToPoint:CGPointMake(180, screenHeight - 90)];
    [path addLineToPoint:CGPointMake(200, screenHeight - 120)];
    [path addLineToPoint:CGPointMake(220, screenHeight - 100)];
    [path addLineToPoint:CGPointMake(240, screenHeight - 180)];
    [path addLineToPoint:CGPointMake(260, screenHeight - 160)];
    [path addLineToPoint:CGPointMake(280, screenHeight - 190)];
    [path addLineToPoint:CGPointMake(300, screenHeight - 150)];
    [path addLineToPoint:CGPointMake(320, screenHeight - 200)];
    [path addLineToPoint:CGPointMake(340, screenHeight - 100)];
    [path addLineToPoint:CGPointMake(360, screenHeight - 110)];
    [path addLineToPoint:CGPointMake(380, screenHeight - 140)];
    [path addLineToPoint:CGPointMake(400, screenHeight - 130)];

    return path;
}

//画曲线图
- (UIBezierPath *)pathThree
{
    float screenWidth = [UIScreen mainScreen].bounds.size.width;
    float screenHeight = [UIScreen mainScreen].bounds.size.height;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, screenHeight/2)];
    [path addLineToPoint:CGPointMake(screenWidth, screenHeight/2)];
    [path moveToPoint:CGPointMake(screenWidth/2, 0)];
    [path addLineToPoint:CGPointMake(screenWidth/2, screenHeight)];
    
    [path moveToPoint:CGPointMake(0,screenHeight/2 )];
    CGPoint endPoint_1 = CGPointMake(screenWidth/2, screenHeight/2);
    CGPoint endPoint_2 = CGPointMake(screenWidth, screenHeight/2);
    CGPoint control_1 = CGPointMake(screenWidth/4, 0);
    CGPoint control_2 = CGPointMake(screenWidth*3/4, screenHeight);
    [path addQuadCurveToPoint:endPoint_1 controlPoint:control_1];
    [path addQuadCurveToPoint:endPoint_2 controlPoint:control_2];
    
    CGPoint endPoint_3 = CGPointMake(screenWidth/2, screenHeight/2);
    CGPoint endPoint_4 = CGPointMake(0, screenHeight/2);
    CGPoint control_3 = CGPointMake(screenWidth*3/4, 0);
    CGPoint control_4 = CGPointMake(screenWidth/4, screenHeight);
    [path addQuadCurveToPoint:endPoint_3 controlPoint:control_3];
    [path addQuadCurveToPoint:endPoint_4 controlPoint:control_4];
    
    
    
    return path;
}
@end
