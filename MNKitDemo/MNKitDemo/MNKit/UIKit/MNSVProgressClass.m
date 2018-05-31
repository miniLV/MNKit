//
//  MNSVProgressClass.m
//  HCCF
//
//  Created by 梁宇航 on 2017/12/22.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import "MNSVProgressClass.h"
@implementation MNSVProgressClass


+ (void)mn_dismiss{
    
    if ([SVProgressHUD isVisible]) {
        
        [SVProgressHUD dismissWithDelay:1.0];
        
        //消失动画(1S)
        [SVProgressHUD setFadeOutAnimationDuration:1.0];
    }
}

+  (void)setSVDuration:(CGFloat)time{
    
    //设置标题颜色
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    
    //设置背景色
    [SVProgressHUD setBackgroundColor:[UIColor darkGrayColor]];
    
    //1.5s后消失
    [SVProgressHUD dismissWithDelay:time];
    
    //消失动画(1S)
    [SVProgressHUD setFadeOutAnimationDuration:1.0];

    //禁止用户交互
    if(time >= 3){
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    }else{
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    }
}

+ (void)defaultSetting{

    [self setSVDuration:1.5];
}



+ (void)longTimeSetting{

    [self longTimeSettingWithTouch:NO];
    //    //设置标题颜色
//    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
//
//    //设置背景色
//    [SVProgressHUD setBackgroundColor:HZ_888888Color];
//
//    //1.5s后消失
////    [SVProgressHUD dismissWithDelay:10];
//
//    //消失动画(1S)
//    [SVProgressHUD setFadeOutAnimationDuration:1.0];
//
//    //禁止用户交互
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
}

+ (void)longTimeSettingWithTouch:(BOOL)canTouch{
    //设置标题颜色
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    
    //设置背景色
    [SVProgressHUD setBackgroundColor:[UIColor darkGrayColor]];
    
    //1.5s后消失
    //    [SVProgressHUD dismissWithDelay:10];
    
    //消失动画(1S)
    [SVProgressHUD setFadeOutAnimationDuration:1.0];
    
    //禁止用户交互
    if (!canTouch) {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    }
}



+(void)showWithStatus:(NSString *)string{
    
    [self defaultSetting];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [SVProgressHUD showWithStatus:string];
        
        [SVProgressHUD dismissWithDelay:1.0];
    });
}

///只显示一个最简单的label
+ (void)showNormalTitle:(NSString *)titleStr{
    
    [self defaultSetting];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showImage:nil status:titleStr];
        
        [SVProgressHUD dismissWithDelay:1.0];
    });
    
    
}

+ (void)show3SNormalTitle:(NSString *)titleStr{
    
    [self setSVDuration:3];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showImage:nil status:titleStr];
        
        [SVProgressHUD dismissWithDelay:1.0];
    });
}

+ (void)show5SNormalTitle:(NSString *)titleStr{
    
    [self setSVDuration:5];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showImage:nil status:titleStr];
        
        [SVProgressHUD dismissWithDelay:1.0];
    });
}

+ (void)show10STimeStatus:(NSString *)string{
    
    [self setSVDuration:10];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showWithStatus:string];
    });
}

+ (void)showLongTimeStatus:(NSString *)string{
    
    [self longTimeSetting];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showWithStatus:string];
    });
}

+ (void)mn_show2sTimeStatus:(NSString *)string{
    
    [self setSVDuration:2.5];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [SVProgressHUD showWithStatus:string];
    });
}

+ (void)showLongTimeStatus:(NSString *)string canTouch:(BOOL)canTouch{
    
    [self longTimeSettingWithTouch:canTouch];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showWithStatus:string];
    });
}


+ (void)mn_showSuccess:(NSString *)string{
    [self setSVDuration:3.5];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [SVProgressHUD showSuccessWithStatus:string];
    });
}


///是否值为nil，要设置提示
+ (BOOL)isValueNilWithSVTips:(NSString *)tipStr key:(NSString *)key{
    
    if (!key || key.length == 0) {

        [MNSVProgressClass showNormalTitle:tipStr];
        return YES;
    }
    return NO;
}

+ (void)mn_normalShowLoading{
    
    [self showLongTimeStatus:@"正在加载中，请稍后..." canTouch:YES];
}


@end
