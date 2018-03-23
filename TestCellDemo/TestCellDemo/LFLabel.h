//
//  LFLabel.h
//  HCCF
//
//  Created by Lyh on 2018/1/23.
//  Copyright © 2018年 xmhccf. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface LFLabel : UILabel

+(instancetype)labelWithFont:(UIFont *)font color:(UIColor *)color;

///快速创建 - 只有title && 字体大小与字号（最常见）
+(instancetype)labelWithTitle:(NSString *)title
                         font:(UIFont *)font
                        color:(UIColor *)color;

+(instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing;

///快速计算 - 这个数组里面所有label + 间距的高度
+ (CGFloat)calLabelsHeight:(NSArray *)contentLabels
                  fontSize:(UIFont *)fontSize
               lineSpacing:(CGFloat)lineSpacing;

+ (CGFloat)calLabelsHeight:(NSArray *)contentLabels
        heightWithFontSize:(UIFont *)fontSize
                     width:(CGFloat)width
               lineSpacing:(CGFloat)lineSpacing;


+ (CGFloat)calLabelsHeight:(NSArray *)contentLabels
                  fontSize:(UIFont *)fontSize
                     width:(CGFloat)width
               lineSpacing:(CGFloat)lineSpacing
          paragraphSpacing:(CGFloat)paragraphSpacing;

@end

@interface LFOrderLabel : LFLabel

///投保人、被保人之类的标题label（fontSize13，color - 777777）
+ (instancetype) leftLabelTitle:(NSString *)title;

///首页内容Label（fontSize13，color - 39393D）
+ (instancetype) contentLabel;

///详情页headerView title（fontSize15，color - 1D1D26）
+ (instancetype) detailViewTitleLabel;
+ (instancetype) detailViewTitleLabel:(NSString *)title;
@end
