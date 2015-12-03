//
//  NavigationControllerDelegate.h
//  NavigationController
//
//  Created by BryanLi on 15/12/2.
//  Copyright © 2015年 lihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NavigationAnimator.h"
#import "NavigationPushAnimator.h"

@interface NavigationControllerDelegate : NSObject <UINavigationControllerDelegate>

@property (nonatomic, weak) UINavigationController *navigationController;
@property (nonatomic, strong) NavigationPushAnimator *pushAnimator;
@property (nonatomic, strong) NavigationAnimator *animator;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition* interactionController;
@property (nonatomic, strong) UIPanGestureRecognizer *gesture;

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;

@end
