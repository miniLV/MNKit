//
//  LFLabel.m
//  HCCF
//
//  Created by Lyh on 2018/1/23.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "LFLabel.h"
#import "UILabel+Utils.h"
#import "HZCommonFont.h"
#import "HZCommonColor.h"

@implementation LFLabel

#pragma mark - createLabel

+(instancetype)labelWithFont:(UIFont *)font color:(UIColor *)color{
    return [self labelWithTitle:@"" color:color font:font lineSpacing:0];
}

+(instancetype)labelWithTitle:(NSString *)title
                         font:(UIFont *)font
                        color:(UIColor *)color{
 
    return [self labelWithTitle:title
                          color:color
                           font:font
                    lineSpacing:0];
}

+(instancetype)labelWithTitle:(NSString *)title
                        color:(UIColor *)color
                         font:(UIFont *)font
                  lineSpacing:(CGFloat)lineSpacing{
    
    return [[self alloc]initWithTitle:title color:color font:font lineSpacing:lineSpacing];
}

- (instancetype)initWithColor:(UIColor *)color font:(UIFont *)font{
    return [self initWithColor:color font:font lineSpacing:0];
}

- (instancetype)initWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font{
    return [self initWithTitle:title color:color font:font lineSpacing:0];
}

- (instancetype)initWithColor:(UIColor *)color font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing{
    return [self initWithTitle:@"" color:color font:font lineSpacing:lineSpacing];
}
- (instancetype)initWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing{
    
    if (self = [super init]) {
        
        self.textColor = color;
        self.font = font;
        self.numberOfLines = 0;
        
        [self setText:title lineSpacing:lineSpacing];
    }
    return self;
}


#pragma mark - calLabelHeight

+ (CGFloat)calLabelsHeight:(NSArray *)contentLabels
                  fontSize:(UIFont *)fontSize
               lineSpacing:(CGFloat)lineSpacing{
    
    CGFloat defaultWidth = 375 - 2*15;
    
    return [self calLabelsHeight:contentLabels
              heightWithFontSize:fontSize
                           width:defaultWidth
                     lineSpacing:lineSpacing];
}

+ (CGFloat)calLabelsHeight:(NSArray *)contentLabels
        heightWithFontSize:(UIFont *)fontSize
                     width:(CGFloat)width
               lineSpacing:(CGFloat)lineSpacing
{
    return [self calLabelsHeight:contentLabels
                        fontSize:fontSize width:width
                     lineSpacing:lineSpacing
                paragraphSpacing:0];
    
}


+ (CGFloat)calLabelsHeight:(NSArray *)contentLabels
                  fontSize:(UIFont *)fontSize
                     width:(CGFloat)width
               lineSpacing:(CGFloat)lineSpacing
          paragraphSpacing:(CGFloat)paragraphSpacing{
    
    CGFloat labelViewH = 0;
    for (UILabel *label in contentLabels) {
        
        CGFloat labelH = [UILabel text:label.text
                            HZFontSize:fontSize
                                 width:width
                           lineSpacing:lineSpacing];
        
        labelViewH += labelH + paragraphSpacing;
    }
    return labelViewH + 25;
}

@end

@implementation LFOrderLabel

///投保人、被保人之类的标题label

+ (instancetype) leftLabelTitle:(NSString *)title{
    
    return [[self alloc]initWithTitle:title color:HZ_777777Color font:HZ_13FontSize];
}

///首页内容Label
+ (instancetype) contentLabel{
    return [[self alloc]initWithColor:HZ_39393DColor font:HZ_13FontSize];
}


//详情页header 主标题
+ (instancetype) detailViewTitleLabel{
    return [[self alloc]initWithColor:HZ_1D1D26Color font:HZ_15FontSize];
}
+ (instancetype) detailViewTitleLabel:(NSString *)title{
    return [[self alloc]initWithTitle:title color:HZ_1D1D26Color font:HZ_15FontSize];
}

@end
