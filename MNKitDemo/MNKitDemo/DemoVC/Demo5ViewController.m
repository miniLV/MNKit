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
    self.view.backgroundColor = [UIColor orangeColor];
    
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
    [btn2 setTitle:@"10s title自动消失提示框" forState:UIControlStateNormal];
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
    
    //4.操作成功提示框
    UIButton *btn4 = [[UIButton alloc]init];
    [btn4 setTitle:@"显示加载gif图片动画" forState:UIControlStateNormal];
    btn4.frame = CGRectMake(50, 480, 250, 50);
    [self.view addSubview:btn4];
    [btn4 setBackgroundColor:[UIColor lightGrayColor]];
    [btn4 addTarget:self action:@selector(p_clickBtn4) forControlEvents:UIControlEventTouchUpInside];
}

- (void)p_clickBtn0{
    [MNSVProgressClass showNormalTitle:@"只有文字的提示框"];
}

- (void)p_clickBtn1{
    
    [MNSVProgressClass showStatus:@"加载中..." time:10];
}

- (void)p_clickBtn2{
    [MNSVProgressClass showNormalTitle:@"10s title自动消失提示框" showTime:10];
}

- (void)p_clickBtn3{
    [MNSVProgressClass showSuccess:@"操作成功"];
}

- (void)p_clickBtn4{
    
    [MNSVProgressClass showLoading];
}

@end
