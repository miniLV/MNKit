//
//  UIButton+MNButton.h
//  MNKitDemo
//
//  Created by TB-Mac-107 on 2019/1/14.
//  Copyright © 2019年 梁宇航. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^TouchedButtonBlock)(void);

@interface UIButton (MNButton)

///快速创建一个只有图片&&点击事件的button
+ (instancetype)mn_buttonWithBackgroundImage:(UIImage *)backgroundImage
                                  parentView:(UIView *)parentView
                                  targetName:(SEL)targetName
                                    delegate:(id)delegate;

/**
 快速创建UIButton
 
 @param title 按钮title
 @param titleColor titleColor
 @param fontSize titleFont
 @param backgroundColor btnBackgroundColor
 @param parentView 父控件
 @param targetName 添加touchUpInSide方法的方法
 @param delegate 响应点击事件的控件
 @return button
 */
+ (instancetype)mn_buttonWithTitle:(NSString *)title
                        titleColor:(UIColor *)titleColor
                          fontSize:(UIFont *)fontSize
                   backgroundColor:(UIColor *)backgroundColor
                        parentView:(UIView *)parentView
                        targetName:(SEL)targetName
                          delegate:(id)delegate;


///清除按钮的选择状态
+ (void)mn_clearBtnsState:(NSArray *)btns;

///以block的形式，为button 添加点击操作
- (void)mn_addActionHandler:(TouchedButtonBlock)touchHandler;

@end

NS_ASSUME_NONNULL_END
