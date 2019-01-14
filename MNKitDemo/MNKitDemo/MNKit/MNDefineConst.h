//
//  MNDefineConst.h
//  MNKitDemo
//
//  Created by TB-Mac-107 on 2019/1/14.
//  Copyright © 2019年 梁宇航. All rights reserved.
//

#ifndef MNDefineConst_h
#define MNDefineConst_h

/**
 动态缩放 - 根据屏幕自适应
 
 目前正常设计图一般是非iPhoneX的居多，如果是以
 - UIDesignDiagramMultiple 配置
    2X : 配置2.0
    3X : 配置3.0
 
 - UIDesignDiagramWidth 配置
    以6s(4.7寸)为模板 : 375.0
    以6Plus(5.5寸)为模板 : 414.0
 
 =======> 需手动修改！
 
 */

// 设计图以6Plus 为例
#define UIDesignDiagramMultiple 3.0
#define UIDesignDiagramWidth 414.0

// 设计图以6s 为例
//#define UIDesignDiagramMultiple 2.0
//#define UIDesignDiagramWidth 375

//屏幕宽高
#define ScreenH  [[UIScreen mainScreen] bounds].size.height
#define ScreenW  [[UIScreen mainScreen] bounds].size.width

// iPhone X
#define  MN_iPhoneX (ScreenW >= 375.f && ScreenH >= 812.f ? YES : NO)

// Status bar height.
#define  MN_StatusBarHeight      (MN_iPhoneX ? 44.f : 20.f)

// bottom margin
#define MN_bottomMargin (MN_iPhoneX ? 34.f : 0)

//默认底部按钮高度 - 不因为iPhone X的tabBar高度变化而改变
#define MN_DefaultBottomBtnHeight 49

// Tabbar height.
#define  MN_DefaultBottomTabBarHeight         (MN_iPhoneX ? (49.f+34.f) : 49.f)

// Status bar & navigation bar height.
#define  MN_DefaultNaviHeight  (MN_iPhoneX ? 88.f : 64.f)

//创建尺寸size
#define  Size(w,h) CGSizeMake((w), (h))

//直接以UI标注的数字作图 - 并实现动态比例适配
#define MNRationW(var)  (ScreenW * ((var/UIDesignDiagramMultiple)/UIDesignDiagramWidth))
#define MNRatioWFont(var) [UIFont systemFontOfSize:TBRationW(var)]
#define MNRatioWFont_Bold(var) [UIFont fontWithName:@"Helvetica-Bold" size:TBRationW(var)]

/***************常用函数***************/

//创建frame
#define Frame(x,y,width,height) CGRectMake(x, y, width, height)

//图片方法(直接字符串赋值)
#define MNImage(imgName)  [UIImage imageNamed:imgName]
#define MNUrl(url)  [NSURL URLWithString:url]
#define MNStringNum(num) [NSString stringWithFormat:@"%ld",(long)num]

#define MNNotiCenter      [NSNotificationCenter defaultCenter]

//默认UserDefault
#define MNUserDefaults [NSUserDefaults standardUserDefaults]

//weakSelf
#define MNWeakSelf __weak typeof(self) weakSelf = self;

//字符串是否为空
#define kIsStringEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kIsArrayEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kIsDictEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kIsObjectEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

#endif /* MNDefineConst_h */
