//
//  Demo4ViewController.m
//  MNKitDemo
//
//  Created by 梁宇航 on 2018/5/31.
//  Copyright © 2018年 梁宇航. All rights reserved.
//

#import "Demo4ViewController.h"
#import "MNCheakTools.h"
#import "MNSVProgressClass.h"

@interface Demo4ViewController ()

//身份证验证
@property (nonatomic,assign)UITextField *idCardTextF;

//车牌号验证
@property (nonatomic,assign)UITextField *carNumTextF;

//手机号验证
@property (nonatomic,assign)UITextField *mobileTextF;

//url验证
@property (nonatomic,assign)UITextField *urlTextF;

//银行卡验证
@property (nonatomic,assign)UITextField *bankTextF;

@end

@implementation Demo4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Demo4 - MNCheakTools";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
}

- (void)setupUI{
    
    NSArray *placeholders = @[@"身份证验证",@"车牌号验证",@"手机号验证",@"url验证",@"银行卡验证"];
    CGFloat x = 100;
    CGFloat width = 200;
    CGFloat height = 50;
    CGFloat heightMargin = 40;
    CGFloat topMargin = 100;
    for (int i = 0; i < placeholders.count; i++) {
        
        CGFloat y = topMargin + i * (heightMargin + height);
        
        UITextField *textField = [[UITextField alloc]init];
        textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
        textField.layer.borderWidth = 1;
        textField.frame = CGRectMake(x, y, width, heightMargin);
        textField.placeholder = placeholders[i];
        [textField addTarget:self action:@selector(p_textEndEdit:) forControlEvents:UIControlEventEditingDidEnd];
        [self.view addSubview:textField];
        
        switch (i) {
            case 0:{
                _idCardTextF = textField;
                break;
            }
            case 1:{
                _carNumTextF = textField;
                break;
            }
            case 2:{
                _mobileTextF = textField;
                break;
            }
            case 3:{
                _urlTextF = textField;
                break;
            }
            case 4:{
                _bankTextF = textField;
                break;
            }
        }
    }

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)p_textEndEdit:(UITextField *)sender{
    
    if (sender == _idCardTextF) {
        
        BOOL check = [MNCheakTools checkIdentityCard:sender.text];
        NSString *checkStr = check ? @"正确" : @"错误";
        NSString *result = [@"身份证验证 --  " stringByAppendingString:checkStr];
        [MNSVProgressClass showNormalTitle:result];
        
    }else if (sender == _mobileTextF){
        
        BOOL check = [MNCheakTools checkTelNumber:sender.text];
        NSString *checkStr = check ? @"正确" : @"错误";
        NSString *result = [@"手机号验证 --  " stringByAppendingString:checkStr];
        [MNSVProgressClass showNormalTitle:result];
        
    }else if (sender == _carNumTextF){
        
        BOOL check = [MNCheakTools checkCarNumber:sender.text];
        NSString *checkStr = check ? @"正确" : @"错误";
        NSString *result = [@"车牌号验证 --  " stringByAppendingString:checkStr];
        [MNSVProgressClass showNormalTitle:result];
        
    }else if (sender == _urlTextF){
        
        BOOL check = [MNCheakTools checkUrl:sender.text];
        NSString *checkStr = check ? @"正确" : @"错误";
        NSString *result = [@"url验证 --  " stringByAppendingString:checkStr];
        [MNSVProgressClass showNormalTitle:result];
        
    }else if (sender == _bankTextF){
        
        BOOL check = [MNCheakTools checkBankCard:sender.text];
        NSString *checkStr = check ? @"正确" : @"错误";
        NSString *result = [@"银行卡号验证 --  " stringByAppendingString:checkStr];
        [MNSVProgressClass showNormalTitle:result];
        
    }
    
}

@end
