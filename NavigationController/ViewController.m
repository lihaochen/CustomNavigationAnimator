//
//  ViewController.m
//  NavigationController
//
//  Created by rimi on 15/6/12.
//  Copyright (c) 2015年 lihao. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = [NSString stringWithFormat:@"%u", arc4random()%100];
        self.navigationColor = [UIColor colorWithRed:arc4random()%225/225.0 green:arc4random()%225/225.0 blue:arc4random()%225/225.0 alpha:1.0];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%225/225.0 green:arc4random()%225/225.0 blue:arc4random()%225/225.0 alpha:1.0];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(100, 0, 200, 200);
    [button1 setTitle:@"push to viewController have navigationbar" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor whiteColor]];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(push1) forControlEvents:UIControlEventTouchUpInside];
    button1.titleLabel.numberOfLines = 0;
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(100, CGRectGetMaxY(button1.frame), 200, 200);
    [button2 setTitle:@"push to viewController have't navigationbar" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor blackColor]];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(push2) forControlEvents:UIControlEventTouchUpInside];
    button2.titleLabel.numberOfLines = 0;
    [self.view addSubview:button2];
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
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end














