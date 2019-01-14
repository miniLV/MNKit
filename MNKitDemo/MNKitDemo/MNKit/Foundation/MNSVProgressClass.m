//
//  MNSVProgressClass.m
//  HCCF
//
//  Created by 梁宇航 on 2017/12/22.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import "MNSVProgressClass.h"
#import "UIImage+GIFImage.h"
#import "MNDefineConst.h"

@implementation MNSVProgressClass


+ (void)dismiss{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([SVProgressHUD isVisible]) {
            
            [SVProgressHUD dismissWithDelay:0.8];
            
            //消失动画(1S)
            [SVProgressHUD setFadeOutAnimationDuration:0.8];
            
        }
    });
    
}

+ (void)dismissWithCompletion:(SVProgressHUDDismissCompletion)completion{
    
    //消失动画(1S)
    [SVProgressHUD setFadeOutAnimationDuration:1.0];
    
    [SVProgressHUD dismissWithCompletion:completion];
}




//基础设置 && 多少秒后隐藏
+ (void)setSVDuration:(CGFloat)time{
    //默认都可以点击
    [self basic_setSVDuration:time canTouch:YES];
}

+  (void)basic_setSVDuration:(CGFloat)time canTouch:(BOOL)canTouch{
    
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
    }
    
    //设置标题颜色
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    
    //设置背景色
    [SVProgressHUD setBackgroundColor:[UIColor darkGrayColor]];
    
    //n秒后消失
    [SVProgressHUD dismissWithDelay:time];
    
    //消失动画(1S)
    [SVProgressHUD setFadeOutAnimationDuration:1.0];
    
    [SVProgressHUD setImageViewSize:CGSizeMake(28,28)];
    
    if (canTouch || time < 3.0) {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
        return;
    }
    //如果响应时间>3s 禁止用户交互
    if(time >= 3){
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    }else{
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    }
}

#pragma mark - NormalTitle

///只显示一个最简单的label
+ (void)showNormalTitle:(NSString *)titleStr{
    
    if ([SVProgressHUD isVisible]) {
        return;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (![SVProgressHUD isVisible]){
            [self setSVDuration:1.5];
            [SVProgressHUD showImage:nil status:titleStr];
        }
    });
}



+ (void)showNormalTitle:(NSString *)titleStr showTime:(NSInteger)time{
    
    if ([SVProgressHUD isVisible]) {
        return;
    }
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (![SVProgressHUD isVisible]) {
            [self setSVDuration:time];
            [SVProgressHUD showImage:nil status:titleStr];
        }
    });
}


#pragma mark - show Status
//显示一个加载转圈圈
+ (void)showStatus:(NSString *)titleStr time:(NSInteger)time{
    if ([SVProgressHUD isVisible]) {
        return;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (![SVProgressHUD isVisible]) {
            [self setSVDuration:time];
            [SVProgressHUD showWithStatus:titleStr];
        }
    });
}


+ (void)showSuccess:(NSString *)string{
    if ([SVProgressHUD isVisible]) {
        return;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (![SVProgressHUD isVisible]) {
            [self setSVDuration:2.0];
            [SVProgressHUD showSuccessWithStatus:string];
        }
    });
}


///是否值为nil，要设置提示
+ (BOOL)isValueNilWithSVTips:(NSString *)tipStr key:(NSString *)key{
    
    if (!key || key.length == 0) {
        if (![SVProgressHUD isVisible]) {
            [MNSVProgressClass showNormalTitle:tipStr];
        }
        return YES;
    }
    return NO;
}

///显示加载中的gif图片
+ (void)p_showLoadingGifWithTouch:(BOOL)canTouch{
    
    [self p_showGifImage:@"pageload_1" duration:20 width:MNRationW(400) height:MNRationW(400) canTouch:canTouch];
}

+ (void)p_showGifImage:(NSString *)imageName duration:(double)duration width:(CGFloat)width height:(CGFloat)height canTouch:(BOOL)canTouch{
    
    if ([SVProgressHUD isVisible]) {
        return;
    }
    
    [self setSVDuration:duration];
    //设置背景色
    [SVProgressHUD setBackgroundColor:[UIColor clearColor]];
    [SVProgressHUD showImage:[UIImage imageWithGIFNamed:imageName] status:nil];
    [SVProgressHUD setImageViewSize:CGSizeMake(width, height)];
    [SVProgressHUD setFadeOutAnimationDuration:0.1];
    
    
    if (!canTouch) {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    }
    else{
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    }
}

+ (void)showLoading{
    
    [self p_showLoadingGifWithTouch:YES];
}


@end
