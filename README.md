# MNKit - 工具类使用说明

> 使用方法：
> 
> 1. 下载当前demo,导入MNKit文件夹
> 2. import “MNKit.h”
> 3. 即可直接使用里面的工具类，使用方法详见demo

#### MNButton

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

---

#### MNLabel
```
//快速设置内容，文字颜色，字体大小，父控件
[MNLabel mn_labelWithTitle:@"test-label1"
                      font:[UIFont systemFontOfSize:14]
                     color:[UIColor lightGrayColor]
                parentView:self.view];
```

[详细说明](https://www.jianshu.com/p/2c2fb7ce634f)
