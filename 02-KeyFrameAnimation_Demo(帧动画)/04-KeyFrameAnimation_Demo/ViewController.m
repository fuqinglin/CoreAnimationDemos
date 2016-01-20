//
//  ViewController.m
//  04-KeyFrameAnimation_Demo
//
//  Created by qinglinfu on 15/9/4.
//  Copyright (c) 2015年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "TSAnimationClass.h"

@interface ViewController ()
{
    UIBezierPath *path;
    CALayer *drawLayer;
    UIImageView *imgView;
}

@property (weak, nonatomic) IBOutlet TSAnimationClass *ballImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    drawLayer = [CALayer layer];
    drawLayer.frame = CGRectMake(0, 120, 320, 320);
    drawLayer.backgroundColor = [UIColor clearColor].CGColor;
    drawLayer.delegate = self;
    [self.view.layer addSublayer:drawLayer];
    [drawLayer setNeedsDisplay];
    
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 120, 30, 30)];
    imgView.image = [UIImage imageNamed:@"lanqiu.png"];
    [drawLayer addSublayer:imgView.layer];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    // 1、多点动画
    CAKeyframeAnimation *rotationAnim = [TSAnimationClass positionAnimationDuration:4.0f withValueCount:10];
    [_ballImageView.layer addAnimation:rotationAnim forKey:nil];
    
    CAKeyframeAnimation *keyAnimation = [TSAnimationClass pathAnimationDuration:2 withPath:path.CGPath];
    [imgView.layer addAnimation:keyAnimation forKey:nil];
    
}


- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 160)];
    CGPoint endPoint1 = CGPointMake(160, 160);
    CGPoint endPoint2 = CGPointMake(320, 160);
    CGPoint controlPoint = CGPointMake(80, 0);
    CGPoint controlPoint2 = CGPointMake(240, 320);
    [path addQuadCurveToPoint:endPoint1 controlPoint:controlPoint];
    [path addQuadCurveToPoint:endPoint2 controlPoint:controlPoint2];
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextSetLineWidth(ctx, 2);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    
    CGContextDrawPath(ctx, kCGPathStroke);
}


@end
