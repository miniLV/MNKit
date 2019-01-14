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

+ (void)dismiss;

+ (void)dismissWithCompletion:(SVProgressHUDDismissCompletion)completion;

///只显示一个最简单的label(1.5s)
+ (void)showNormalTitle:(NSString *)titleStr;

//显示一个N秒最简单的label
+ (void)showNormalTitle:(NSString *)titleStr showTime:(NSInteger)time;

//显示一个加载转圈圈
+ (void)showStatus:(NSString *)title time:(NSInteger)time;

//提示成功
+ (void)showSuccess:(NSString *)string;

///默认显示-正在加载中（可以交互）
+ (void)showLoading;

///是否key的值是否为nil，如果是，提示“tipStr”
+ (BOOL)isValueNilWithSVTips:(NSString *)tipStr key:(NSString *)key;

@end
