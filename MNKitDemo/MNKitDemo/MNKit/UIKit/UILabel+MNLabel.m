//
//  UILabel+MNLabel.m
//  MNKitDemo
//
//  Created by TB-Mac-107 on 2019/1/14.
//  Copyright © 2019年 梁宇航. All rights reserved.
//

#import "UILabel+MNLabel.h"

@implementation UILabel (MNLabel)

#pragma mark - createLabel

+ (instancetype)mn_labelWithFont:(UIFont *)font color:(UIColor *)color parentView:(UIView *)parentView{
    
    return [self mn_labelWithTitle:nil font:font color:color parentView:parentView];
}

+ (instancetype)mn_labelWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color parentView:(UIView *)parentView{
    
    return [self mn_labelWithTitle:title font:font color:color lineSpacing:0 parentView:parentView];
}

+ (instancetype)mn_labelWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color lineSpacing:(CGFloat)lineSpacing parentView:(UIView *)parentView{
    
    return [[self alloc]initWithTitle:title font:font color:color lineSpacing:lineSpacing parentView:parentView];
}

- (instancetype)initWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color lineSpacing:(CGFloat)lineSpacing parentView:(UIView *)parentView{
    
    if (self = [super init]) {
        
        self.textColor = color;
        self.font = font;
        self.numberOfLines = 0;
        self.text = title;
        [self setLineSpacing:lineSpacing];
        
        if (parentView) {
            //添加到父视图
            [parentView addSubview:self];
        }
    }
    return self;
}

#pragma mark - setLineSpacing
- (void)setLineSpacing:(CGFloat)lineSpacing{
    self.numberOfLines = 0;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //调整行距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
}





@end
