//
//  UILabel+MNLabel.h
//  MNKitDemo
//
//  Created by TB-Mac-107 on 2019/1/14.
//  Copyright © 2019年 梁宇航. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (MNLabel)


/**
 快速创建 - 只有字体大小与颜色与父试图的 label
 
 @param font 字体大小
 @param color 字体颜色
 @param parentView 父试图
 @return label
 */
+ (instancetype)mn_labelWithFont:(UIFont *)font
                           color:(UIColor *)color
                      parentView:(UIView *)parentView;

/**
 快速创建 - 有title && 字体大小与颜色的label
 
 @param title 内容文字
 @param font 字体大小
 @param color 字体颜色
 @param parentView 父试图
 @return label
 */
+ (instancetype)mn_labelWithTitle:(NSString *)title
                             font:(UIFont *)font
                            color:(UIColor *)color
                       parentView:(UIView *)parentView;

/**
 快速创建 - 有title && 字体大小与颜色 && 行间距的label
 
 @param title 内容文字
 @param font 字体大小
 @param color 字体颜色
 @param lineSpacing 行间距
 @param parentView 父试图
 @return label
 */
+ (instancetype)mn_labelWithTitle:(NSString *)title
                             font:(UIFont *)font
                            color:(UIColor *)color
                      lineSpacing:(CGFloat)lineSpacing
                       parentView:(UIView *)parentView;

#pragma mark - 等比例缩放设置



#pragma mark - setLineSpacing
- (void)setLineSpacing:(CGFloat)lineSpacing;



@end

NS_ASSUME_NONNULL_END
