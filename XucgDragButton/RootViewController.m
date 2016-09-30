//
//  RootViewController.m
//  XucgDragButton
//
//  Created by xucg on 9/29/16.
//  Copyright © 2016 xucg. All rights reserved.
//

#import "RootViewController.h"
#import "XucgDragButton.h"

@interface RootViewController ()



@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *mifiLiveIcon = [UIImage imageNamed:@"button-icon"];
    XucgDragButton *dragButton = [[XucgDragButton alloc] init];
    dragButton.frame = CGRectMake(5, 100, mifiLiveIcon.size.width, mifiLiveIcon.size.height);
    [dragButton setImage:mifiLiveIcon forState:UIControlStateNormal];
    [dragButton setImage:mifiLiveIcon forState:UIControlStateHighlighted];
    [dragButton setImage:mifiLiveIcon forState:UIControlStateSelected];
    [dragButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dragButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonAction:(id)sender {
    NSLog(@"你点击了dragButton");
}

@end
