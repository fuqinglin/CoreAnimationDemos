//
//  ViewController.m
//  03-CATransition(转场动画)
//
//  Created by qinglinfu on 16/1/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSInteger _index;
}
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (strong, nonatomic)CATransition *animation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:leftSwipe];
    [self.view addGestureRecognizer:rightSwipe];
    
}

- (void)swipeAction:(UISwipeGestureRecognizer *)swipe
{
    

    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        self.animation.subtype = @"fromRight";
        
        if (_index == 4) {
            _index = -1;
        }
        NSString *imageName = [NSString stringWithFormat:@"%ld.jpg",++_index];
        self.photoView.image = [UIImage imageNamed:imageName];
        
    } else {
        self.animation.subtype = @"fromLeft";
        if (_index == 0) {
            _index = 5;
        }
        NSString *imageName = [NSString stringWithFormat:@"%ld.jpg",--_index];
        self.photoView.image = [UIImage imageNamed:imageName];
    }
    
    [self.photoView.layer addAnimation:self.animation forKey:nil];
    
}

- (CATransition *)animation
{
    if (!_animation) {
        _animation = [CATransition animation];
        _animation.duration = 0.5;
        _animation.type = @"pageUnCurl";
        // _animation.type = kCATransitionMoveIn;
        _animation.subtype = @"fromLeft";
        //_animation.subtype = kCATransitionFromLeft;
    }
   
    return _animation;
}

- (void)transitionAnimation
{
    

}



@end
