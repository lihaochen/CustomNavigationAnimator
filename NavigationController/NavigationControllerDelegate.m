//
//  NavigationControllerDelegate.m
//  NavigationController
//
//  Created by BryanLi on 15/12/2.
//  Copyright © 2015年 lihao. All rights reserved.
//

#import "NavigationControllerDelegate.h"

@interface NavigationControllerDelegate () <UIGestureRecognizerDelegate>

@end

@implementation NavigationControllerDelegate

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController
{
    self = [super init];
    if (self) {
        self.navigationController = navigationController;
        [self.navigationController.view addGestureRecognizer:self.gesture];
        self.animator = [NavigationAnimator new];
        self.pushAnimator = [NavigationPushAnimator new];
    }
    return self;
}

- (UIPanGestureRecognizer *)gesture
{
    if (!_gesture) {
        _gesture = ({
            UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handle:)];
//            gesture.edges = UIRectEdgeLeft;
            gesture.delegate = self;
            gesture;
        });
    }
    return _gesture;
}

- (void)handle:(UIPanGestureRecognizer *)gesture
{
    UIView* view = self.navigationController.view;
    if (gesture.state == UIGestureRecognizerStateBegan) {
        if (self.navigationController.viewControllers.count > 1) { // left half
            self.interactionController = [UIPercentDrivenInteractiveTransition new];
            [self.navigationController popViewControllerAnimated:YES];
        }
    } else if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gesture translationInView:view];
        NSLog(@"%@", NSStringFromCGPoint(translation));
        if (translation.x <= 0) {
            return;
        }
        CGFloat d = fabs(translation.x / CGRectGetWidth(view.bounds));
        [self.interactionController updateInteractiveTransition:d];
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        if ([gesture velocityInView:view].x > 0) {
            [self.interactionController finishInteractiveTransition];
        } else {
            [self.interactionController cancelInteractiveTransition];
        }
        self.interactionController = nil;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    return YES;
}


#pragma mark -- <UINavigationControllerDelegate>
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPop) {
        return self.animator;
    }
    return self.pushAnimator;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.interactionController;
}

@end















