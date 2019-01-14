//
//  Demo2ViewController.m
//  MNKitDemo
//
//  Created by 梁宇航 on 2018/5/30.
//  Copyright © 2018年 梁宇航. All rights reserved.
//

#import "Demo2ViewController.h"
#import "UILabel+MNLabel.h"
#import "Masonry.h"

@interface Demo2ViewController ()

@end

@implementation Demo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Demo2 - UILabel";
    
    [self setupUI];
}

- (void)setupUI{

    //设置普通label - label
    UILabel *label1 = [UILabel mn_labelWithTitle:@"test-label1"
                                            font:[UIFont systemFontOfSize:14]
                                           color:[UIColor lightGrayColor]
                                      parentView:self.view];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(80);
    }];
    
    //设置带行间距的label
    NSString *title2 = @"测试-我是标题2，rua~~~测试-我是标题2，rua~~~测试-我是标题2123，rua~~~测试-我是标题2，rua~~~测试-我是标题2，rua~~~测试-我是标题2，rua~~~测试-我是标题2，rua~~~";
    CGFloat label2Width = 300;
    UILabel *label2 = [UILabel mn_labelWithTitle:title2
                                            font:[UIFont systemFontOfSize:14]
                                           color:[UIColor orangeColor]
                                     lineSpacing:4
                                      parentView:self.view];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(200);
        make.width.mas_equalTo(label2Width);
    }];


    ///常见用法 - cell中(创建一个没有title的label)
    UILabel *label3 = [UILabel mn_labelWithFont:[UIFont systemFontOfSize:16]
                                          color:[UIColor purpleColor]
                                     parentView:self.view];
    //setModel中赋值
    label3.text = @"test-CellLabel";
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(-150);
    }];
}


@end
