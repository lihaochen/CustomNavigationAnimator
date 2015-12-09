//
//  NavigationAnimator.m
//  NavigationController
//
//  Created by BryanLi on 15/12/3.
//  Copyright © 2015年 lihao. All rights reserved.
//

#import "NavigationAnimator.h"

@implementation NavigationAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return timeInterval;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    [self animation:transitionContext];
}

#pragma mark - 转场动画
- (void)animation:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    
    toViewController.view.alpha = 0.5;
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.center = CGPointMake(0, toViewController.view.center.y);
    [UIView animateWithDuration:timeInterval delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionAllowUserInteraction animations:^{
        fromViewController.view.center = CGPointMake(CGRectGetWidth(fromViewController.view.bounds)*3/2.f, fromViewController.view.center.y);
        toViewController.view.center = CGPointMake(CGRectGetWidth(toViewController.view.bounds)/2.f, toViewController.view.center.y);
        toViewController.view.alpha = 1;
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    /*
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
     */
        
}

@end
