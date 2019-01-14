//
//  UIButton+MNButton.m
//  MNKitDemo
//
//  Created by TB-Mac-107 on 2019/1/14.
//  Copyright © 2019年 梁宇航. All rights reserved.
//

#import "UIButton+MNButton.h"
#import <objc/runtime.h>

@implementation UIButton (MNButton)

//取消按钮的高亮状态
-(void)setHighlighted:(BOOL)highlighted {
    
}

+ (instancetype)mn_buttonWithTitle:(NSString *)title
                        titleColor:(UIColor *)titleColor
                          fontSize:(UIFont *)fontSize
                   backgroundColor:(UIColor *)backgroundColor
                        parentView:(UIView *)parentView
                        targetName:(SEL)targetName
                          delegate:(id)delegate{
    
    return [self mn_buttonWithTitle:title
                         titleColor:titleColor
                           fontSize:fontSize
                    backgroundColor:backgroundColor
                    backgroundImage:nil
                         parentView:parentView
                         targetName:targetName
                           delegate:delegate];
    
}

+ (instancetype)mn_buttonWithBackgroundImage:(UIImage *)backgroundImage
                                  parentView:(UIView *)parentView
                                  targetName:(SEL)targetName
                                    delegate:(id)delegate{
    return [self mn_buttonWithTitle:nil
                         titleColor:nil
                           fontSize:nil
                    backgroundColor:nil
                    backgroundImage:backgroundImage
                         parentView:parentView
                         targetName:targetName
                           delegate:delegate];
    
}


+ (instancetype)mn_buttonWithTitle:(NSString *)title
                        titleColor:(UIColor *)titleColor
                          fontSize:(UIFont *)fontSize
                   backgroundColor:(UIColor *)backgroundColor
                   backgroundImage:(UIImage *)backgroundImage
                        parentView:(UIView *)parentView
                        targetName:(SEL)targetName
                          delegate:(id)delegate{
    
    return [[self alloc]initWithTitle:title
                           titleColor:titleColor
                             fontSize:fontSize
                      backgroundColor:backgroundColor
                      backgroundImage:backgroundImage
                           parentView:parentView
                           targetName:targetName
                             delegate:delegate];
}

- (instancetype)initWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(UIFont *)fontSize
              backgroundColor:(UIColor *)backgroundColor
              backgroundImage:(UIImage *)backgroundImage
                   parentView:(UIView *)parentView
                   targetName:(SEL)targetName
                     delegate:(id)delegate{
    
    if (self = [super init]) {

        self.titleLabel.font = fontSize;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        if (backgroundColor) {
            [self setBackgroundColor:backgroundColor];
        }
        if (backgroundImage) {
            [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
        }
        if (parentView) {
            [parentView addSubview:self];
        }
        if (targetName && delegate) {
            [self addTarget:delegate action:targetName forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

//清除按钮的所有选择状态
+ (void)mn_clearBtnsState:(NSArray *)btns{
    
    for (UIButton *btn in btns) {
        btn.selected = NO;
    }
}

//添加block的点击事件
- (void)mn_addActionHandler:(TouchedButtonBlock)touchHandler
{
    objc_setAssociatedObject(self, @selector(mn_addActionHandler:), touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(blockActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)blockActionTouched:(UIButton *)btn
{
    TouchedButtonBlock block = objc_getAssociatedObject(self, @selector(mn_addActionHandler:));
    if (block)
    {
        block();
    }
}

@end
