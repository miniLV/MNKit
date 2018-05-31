//
//  Demo3ViewController.m
//  MNKitDemo
//
//  Created by 梁宇航 on 2018/5/31.
//  Copyright © 2018年 梁宇航. All rights reserved.
//

#import "Demo3ViewController.h"

@interface Demo3ViewController ()

@end

@implementation Demo3ViewController

- (void)viewDidLoad {

    self.title = @"Demo3 - UIImage+Original";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
}

- (void)setupUI{
    
    //普通button
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(100, 100, 100, 50);
    [btn setBackgroundImage:[UIImage imageNamed:@"退出登录"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

@end
