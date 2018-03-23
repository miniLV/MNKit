//
//  CMAddCustomDatas.m
//  HCCF
//
//  Created by Lyh on 2018/3/21.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "CMAddCustomDatas.h"
#import "LFbasicCellModel.h"

//#import "HZLocalSaveDatas.h"
//#import "CMUrls.h"
//#import "HZLocalSaveDatas.h"
//#import "HZJGModel.h"

@implementation CMAddCustomDatas

+ (NSArray *)localDatas{
    
    NSArray *section0 = [self p_getSection0];
    
    NSArray *section1 = [self p_getSection1];
    
    NSArray *section2 = [self p_getSection2];
    
    return @[section0, section1, section2];
}

+ (NSArray *)p_getSection0{
    
    NSArray *titles = @[@"客户姓名", @"性别", @"出生日期", @"手机号码"];
    NSArray *types = @[@"50", @"2", @"8", @"32"];
    NSArray *placeholders = @[@"请输入姓名(必填)", @"请选择性别", @"请选择出生日期", @"请输入手机号码(必填)"];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i = 0 ; i < titles.count; i ++) {
        LFbasicCellModel *model = [[LFbasicCellModel alloc]init];
        model.titleLabel = titles[i];
        model.type = [types[i] integerValue];
        model.placeholder = placeholders[i];
        [arrayM addObject:model];
    }
    return arrayM.copy;
}

+ (NSArray *)p_getSection1{
    
    NSArray *titles = @[@"证件类型", @"证件号码"];
    NSArray *types = @[@"2", @"31"];
    NSArray *placeholders = @[@"请选择证件类型", @"请输入证件号码(必填)"];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i = 0 ; i < titles.count; i ++) {
        LFbasicCellModel *model = [[LFbasicCellModel alloc]init];
        model.titleLabel = titles[i];
        model.type = [types[i] integerValue];
        model.placeholder = placeholders[i];
        [arrayM addObject:model];
    }
    return arrayM.copy;
}
+ (NSArray *)p_getSection2{
    
    NSArray *titles = @[@"电子邮箱", @"所在省市区", @"详细地址"];
    NSArray *types = @[@"33", @"10", @"11"];
    NSArray *placeholders = @[@"请输入电子邮箱", @"请选择省市区", @"请输入详细地址(至少6个汉字)"];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i = 0 ; i < titles.count; i ++) {
        LFbasicCellModel *model = [[LFbasicCellModel alloc]init];
        model.titleLabel = titles[i];
        model.type = [types[i] integerValue];
        model.placeholder = placeholders[i];
        [arrayM addObject:model];
    }
    return arrayM.copy;
}

+ (NSArray *)handleDatas{
    
    NSArray *basicArray = [self localDatas];
    
//    //1.section0 row1 = 性别列表
//    NSArray *section0 = basicArray.firstObject;
//    LFbasicCellModel *genderModel = section0[1];
//    NSArray *genderList = [HZLocalSaveDatas getGenderNameList];
//    genderModel.rightList = genderList;
//
//    //2.section1 row0 = 证件类型列表
//    NSArray *section1 = basicArray[1];
//    LFbasicCellModel *cardTypeModel = section1.firstObject;
//    NSArray *cardTypes = [HZLocalSaveDatas getCardTypeNameList];
//    cardTypeModel.rightList = cardTypes;
    
    return basicArray;
}

/**
 提交数据
 */

+ (void)postDatas:(NSArray *)datas{
    
    NSDictionary *parameters = [self p_getParametersWithDatas:datas];
    
//    [YHAFNHelper post:CMCustomerUrl parameters:parameters success:^(id responseObject) {
//
//        MNLog(@"responseObject = %@",responseObject)
//
//    } faliure:nil];

}

+ (NSDictionary *)p_getParametersWithDatas:(NSArray *)datas{
    
//    //1.客户姓名
//    LFbasicCellModel *model0 = datas[0][0];
//    NSString *nameStr = model0.textFieldValue ? : @"";
//
//    //2.gender
//    LFbasicCellModel *model1 = datas[0][1];
//    NSString *genderID = [HZLocalSaveDatas getGenderIDWithGenderName:model1.selectedValue] ? : @"";
//
//    //3.birthday
//    LFbasicCellModel *model2 = datas[0][2];
//    NSString *birthdayStr = model2.selectedValue ? : @"";
//
//    //4.mobile
//    LFbasicCellModel *model3 = datas[0][3];
//    NSString *mobile = model3.textFieldValue ? : @"";
//
//    //5.cardType
//    LFbasicCellModel *model4 = datas[1][0];
//    NSString *cardTypeID = [HZLocalSaveDatas getCardIDWithCardName:model4.selectedValue] ? : @"";
//
//    //6.cardNum
//    LFbasicCellModel *model5 = datas[1][1];
//    NSString *cardNum = model5.textFieldValue ? : @"";
//
//    //7.email
//    LFbasicCellModel *model6 = datas[2][0];
//    NSString *email = model6.textFieldValue ? : @"";
//
//    //8.areaCode
//    LFbasicCellModel *model7 = datas[2][1];
//    NSString *areaCode = model7.selectedCode ? : @"";
//    MNLog(@"areaCode = %@, name = %@",areaCode, model7.selectedValue)
//
//    //9.detailAddress
//    LFbasicCellModel *model8 = datas[2][2];
//    NSString *address = model8.textFieldValue ? : @"";
//
//    return @{
//             @"name": nameStr,
//             @"mobile": mobile,
//             @"id_type": cardTypeID,
//             @"id_num": cardNum,
//             @"sex": genderID,
//             @"birthday": birthdayStr,
//             @"email": email,
//             @"areacode": areaCode,
//             @"address": address,
//             @"flag": @YES,
//             @"remarks": @"备注"
//             };
    return @{};
}


@end
