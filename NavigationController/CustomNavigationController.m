//
//  CustomNavigationController.m
//  NavigationController
//
//  Created by BryanLi on 15/12/3.
//  Copyright © 2015年 lihao. All rights reserved.
//

#import "CustomNavigationController.h"
#import "NavigationControllerDelegate.h"

@interface CustomNavigationController ()

@property (nonatomic, strong) NavigationControllerDelegate *naviDelegate;

@end

@implementation CustomNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.naviDelegate = [[NavigationControllerDelegate alloc] initWithNavigationController:self];
        self.delegate = self.naviDelegate;
        
//        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_bg"] forBarMetrics:UIBarMetricsDefault];
//        [self.navigationBar setBackgroundColor:[UIColor whiteColor]];
//        [self.navigationBar setBarStyle:UIBarStyleBlack];
        [self.navigationBar setTranslucent:NO];
        self.navigationBar.tintColor = [UIColor blackColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




@end


















