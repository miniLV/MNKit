//
//  Demo1ViewController.m
//  MNKitDemo
//
//  Created by 梁宇航 on 2018/5/29.
//  Copyright © 2018年 梁宇航. All rights reserved.
//

#import "Demo1ViewController.h"
#import "MNButton.h"
#import "Masonry.h"
@interface Demo1ViewController ()

@end

@implementation Demo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"demo1 - MNButton";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    
}

- (void)setupUI{
    
    //1.一句代码设置 - 按钮标题 && 颜色 && 字号 && 父试图 && 响应方法
    
    /** --等价于这些设置
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(clickSendBtn) forControlEvents:UIControlEventTouchUpInside];
     */
    
    MNButton *sendBtn = [MNButton buttonWithTitle:@"获取验证码"
                                       titleColor:[UIColor orangeColor]
                                         fontSize:[UIFont systemFontOfSize:14]
                                  backgroundColor:[UIColor lightGrayColor]
                                       parentView:self.view
                                       targetName:@selector(clickSendBtn)
                                         delegate:self];
    [sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(100);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    
    //2.一句代码设置 - 按钮背景图片(默认状态) && 父试图 && 响应方法
    UIImage *starImage = [UIImage imageNamed:@"Notcollection"];
    UIButton *starBtn = [MNButton buttonWithBackgroundImage:starImage
                                                 parentView:self.view
                                                 targetName:@selector(p_clickStarBtn)
                                                   delegate:self];
    [starBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.height.mas_equalTo(50);
    }];
    
    //3.一句代码设置底部按钮(自带约束 - bottom && left && right 约束都是0)
    [MNButton mn_bottomBtnWithTitle:@"底部按钮"
                         titleColor:[UIColor lightGrayColor]
                           fontSize:[UIFont systemFontOfSize:15]
                    backgroundColor:[UIColor orangeColor]
                         parentView:self.view
                             height:55
                         targetName:@selector(p_clickBottomBtn)
                           delegate:self];
}

#pragma mark - control touch

- (void)clickSendBtn{
    NSLog(@"clickSendBtn");
}

- (void)p_clickStarBtn{
    NSLog(@"p_clickStarBtn");
}

- (void)p_clickBottomBtn{
    NSLog(@"p_clickBottomBtn");
}

@end
