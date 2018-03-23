//
//  CMConst.h
//  HCCF
//
//  Created by Lyh on 2018/3/19.
//  Copyright © 2018年 xmhccf. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CMConst : NSObject

/**
 添加客户模块 - 详细地址textView的 leftMargin && rightMargin
 */
extern CGFloat const CMAddressTextViewLeftMargin;
extern CGFloat const CMAddressTextViewRightMargin;


@end

@interface CMColor : NSObject

+ (UIColor *)textFieldPlaceholderColor;

+ (UIColor *)textFieldInputColor;

+ (UIColor *)dividingLineColor;

+ (UIColor *)backgroundColor;

@end
