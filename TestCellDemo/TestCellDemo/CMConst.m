//
//  CMConst.m
//  HCCF
//
//  Created by Lyh on 2018/3/19.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "CMConst.h"
#import "UIColor+Hex.h"
@implementation CMConst

/**
 添加客户模块 - 详细地址textView的 leftMargin && rightMargin
 */
CGFloat const CMAddressTextViewLeftMargin = 140;
CGFloat const CMAddressTextViewRightMargin = 35;

@end

@implementation CMColor

+ (UIColor *)textFieldPlaceholderColor{
    return [UIColor colorWithHexString:@"C8C8C8"];
}

+ (UIColor *)textFieldInputColor{
    return [UIColor colorWithHexString:@"494949"];
}

+ (UIColor *)dividingLineColor{
    return [UIColor colorWithHexString:@"EBEBEB"];
}

+ (UIColor *)backgroundColor{
    return [UIColor colorWithHexString:@"F2F3F7"];
}
@end
