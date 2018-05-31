//
//  Demo3ViewController.m
//  MNKitDemo
//
//  Created by 梁宇航 on 2018/5/31.
//  Copyright © 2018年 梁宇航. All rights reserved.
//

#import "Demo3ViewController.h"
#import "UIImage+Original.h"
@interface Demo3ViewController ()

@end

@implementation Demo3ViewController

- (void)viewDidLoad {

    self.title = @"Demo3 - UIImage+Original";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
}

- (void)setupUI{
    
    //button 渲染图片
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn setImage:[UIImage imageNamed:@"身份证相机"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    //button - 显示原图
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(100, 300, 100, 100);
    [btn2 setImage:[UIImage imageNamedWithRenderOriginal:@"身份证相机"] forState:UIControlStateNormal];
    [self.view addSubview:btn2];
}

@end
