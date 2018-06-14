# MNKit - 工具类使用说明

#### MNButton
- 带文字的button

```
基础创建 :
  UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(clickSendBtn) forControlEvents:UIControlEventTouchUpInside];
```



```
使用MNbutton快速创建:
//一句代码设置 - 按钮标题 && 颜色 && 字号 && 父试图 && 响应方法
MNButton *sendBtn = [MNButton buttonWithTitle:@"获取验证码"
                                       titleColor:[UIColor orangeColor]
                                         fontSize:[UIFont systemFontOfSize:14]
                                  backgroundColor:[UIColor lightGrayColor]
                                       parentView:self.view
                                       targetName:@selector(clickSendBtn)
                                         delegate:self];

```

```
 	//一句代码设置 - 按钮背景图片(默认状态) && 父试图 && 响应方法
    UIImage *starImage = [UIImage imageNamed:@"Notcollection"];
    UIButton *starBtn = [MNButton buttonWithBackgroundImage:starImage
                                                 parentView:self.view
                                                 targetName:@selector(p_clickStarBtn)
                                                   delegate:self];
    [starBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.height.mas_equalTo(50);
    }];
```