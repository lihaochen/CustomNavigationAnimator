//
//  TestViewController.m
//  NavigationController
//
//  Created by BryanLi on 15/12/3.
//  Copyright © 2015年 lihao. All rights reserved.
//

#import "TestViewController.h"
#import "ViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.automaticallyAdjustsScrollViewInsets = NO;
        self.title = @"test";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];    
    
    UIScrollView *view = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    view.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), 1800);
    [self.view addSubview:view];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(100, 0, 200, 200);
    [button1 setBackgroundColor:[UIColor whiteColor]];
    [button1 setTitle:@"push to viewController have navigationbar" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button1.titleLabel.numberOfLines = 0;
    [button1 addTarget:self action:@selector(push1) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(100, 300, 200, 200);
    [button2 setBackgroundColor:[UIColor blackColor]];
    [button2 setTitle:@"push to viewController have't navigationbar" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(push2) forControlEvents:UIControlEventTouchUpInside];
    button2.titleLabel.numberOfLines = 0;
    [view addSubview:button2];
}

- (void)push1
{
    [self.navigationController pushViewController:[[ViewController alloc] init] animated:YES];
}

- (void)push2
{
    [self.navigationController pushViewController:[[TestViewController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

@end
