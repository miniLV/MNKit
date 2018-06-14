//
//  MNSVProgressClass.h
//  HCCF
//
//  Created by 梁宇航 on 2017/12/22.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"

@interface MNSVProgressClass : NSObject

+ (void)mn_dismiss;

///只显示一个最简单的label
+ (void)showNormalTitle:(NSString *)titleStr;

//显示一个3S最简单的label
+ (void)show3SNormalTitle:(NSString *)titleStr;

//数据比较多的时候，显示5s在miss
+ (void)show5SNormalTitle:(NSString *)titleStr;

///显示转圈圈状态
+ (void)showWithStatus:(NSString *)string;

///10s的转圈圈
+ (void)show10STimeStatus:(NSString *)string;

//显示2s的转圈圈
+ (void)mn_show2sTimeStatus:(NSString *)string;

///网络请求很慢 - 很长时间的转圈圈(禁止用户交互)
+ (void)showLongTimeStatus:(NSString *)string;

///网络请求很慢 - 很长时间的转圈圈(webView加载-允许用户交互)
+ (void)showLongTimeStatus:(NSString *)string canTouch:(BOOL)canTouch;

///是否值为nil，要设置提示
+ (BOOL)isValueNilWithSVTips:(NSString *)tipStr key:(NSString *)key;

+ (void)mn_showSuccess:(NSString *)string;

///默认显示-正在加载中
+ (void)mn_normalShowLoading;

@end
