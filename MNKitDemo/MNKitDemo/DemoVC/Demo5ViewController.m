//
//  Demo5ViewController.m
//  MNKitDemo
//
//  Created by 梁宇航 on 2018/6/14.
//  Copyright © 2018年 梁宇航. All rights reserved.
//

#import "Demo5ViewController.h"
#import "MNSVProgressClass.h"
#import "UIButton+MNButton.h"
@interface Demo5ViewController ()

@end

@implementation Demo5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Demo5 - MNSVProgress";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
}

- (void)setupUI{
    
    //0.简单只有文字的SV提示框
    UIButton *btn0 = [[UIButton alloc]init];
    [btn0 setTitle:@"只有文字的提示框" forState:UIControlStateNormal];
    btn0.frame = CGRectMake(50, 80, 250, 50);
    [self.view addSubview:btn0];
    [btn0 setBackgroundColor:[UIColor lightGrayColor]];
    [btn0 addTarget:self action:@selector(p_clickBtn0) forControlEvents:UIControlEventTouchUpInside];
    
    //1.转圈圈且可以点击的提示框
    UIButton *btn1 = [[UIButton alloc]init];
    [btn1 setTitle:@"正在加载中的提示框" forState:UIControlStateNormal];
    btn1.frame = CGRectMake(50, 180, 250, 50);
    [self.view addSubview:btn1];
    [btn1 setBackgroundColor:[UIColor lightGrayColor]];
    [btn1 addTarget:self action:@selector(p_clickBtn1) forControlEvents:UIControlEventTouchUpInside];
    
    //2.10s转圈圈自动消失提示框
    UIButton *btn2 = [[UIButton alloc]init];
    [btn2 setTitle:@"10s转圈圈自动消失提示框" forState:UIControlStateNormal];
    btn2.frame = CGRectMake(50, 280, 250, 50);
    [self.view addSubview:btn2];
    [btn2 setBackgroundColor:[UIColor lightGrayColor]];
    [btn2 addTarget:self action:@selector(p_clickBtn2) forControlEvents:UIControlEventTouchUpInside];
    
    //3.操作成功提示框
    UIButton *btn3 = [[UIButton alloc]init];
    [btn3 setTitle:@"操作成功提示框" forState:UIControlStateNormal];
    btn3.frame = CGRectMake(50, 380, 250, 50);
    [self.view addSubview:btn3];
    [btn3 setBackgroundColor:[UIColor lightGrayColor]];
    [btn3 addTarget:self action:@selector(p_clickBtn3) forControlEvents:UIControlEventTouchUpInside];
}

- (void)p_clickBtn0{
    [MNSVProgressClass show3SNormalTitle:@"只有文字的提示框"];
}

- (void)p_clickBtn1{
    
    [MNSVProgressClass mn_normalShowLoading];
    
    //需要手动设置miss
    [SVProgressHUD dismissWithDelay:3.0];
}

- (void)p_clickBtn2{
    [MNSVProgressClass mn_show10STimeStatus:@"10s转圈圈自动消失提示框"];
}

- (void)p_clickBtn3{
    [MNSVProgressClass mn_showSuccess:@"操作成功"];
}

@end
