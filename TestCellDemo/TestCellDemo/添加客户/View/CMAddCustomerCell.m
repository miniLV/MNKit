//
//  CMAddCustomerCell.m
//  HCCF
//
//  Created by Lyh on 2018/3/21.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "CMAddCustomerCell.h"
#import "HZCommonFont.h"
#import "HZCommonColor.h"
#import "LFbasicCellModel.h"

@implementation CMAddCustomerCell



- (void)setupControls{
    [super setupControls];
    
    self.titleLabel.font = HZ_15FontSize;
    self.rightLabel.font = HZ_15FontSize;
    self.rightLabel.textColor = HZ_C8C8C8Color;
    self.rightTextField.font = HZ_15FontSize;
    self.rightTextField.textColor = HZ_494949Color;
    self.rightIDCardTextField.font = HZ_15FontSize;
    self.rightTextField.textColor = HZ_494949Color;
    [self.rightTextField addTarget:self action:@selector(endEditTextField:) forControlEvents:UIControlEventEditingDidEnd];
    [self.rightIDCardTextField addTarget:self action:@selector(endEditTextField:) forControlEvents:UIControlEventEditingDidEnd];
}

- (void)setBasicModel:(LFbasicCellModel *)basicModel{
    
    self.titleLabel.text = basicModel.titleLabel;
    
    NSInteger tag = self.basicIndexPath.section * 100 + self.basicIndexPath.row;
    self.rightIDCardTextField.tag = tag;
    self.rightTextField.tag = tag;
    
    switch (basicModel.type) {
        case 2:
        {
            self.rightLabel.hidden = NO;
            self.rightIV.hidden = NO;
//            self.rightIV.image = MNImage(@"arrow-x");
            self.rightLabel.text = basicModel.selectedValue ? : basicModel.placeholder;
            self.rightLabel.textColor = basicModel.selectedValue ? HZ_494949Color : HZ_C8C8C8Color;
            break;
        }
        case 8:{
            self.rightLabel.hidden = NO;
            self.rightIV.hidden = NO;
//            self.rightIV.image = MNImage(@"Date");
            self.rightLabel.text = basicModel.selectedValue ? : basicModel.placeholder;
            self.rightLabel.textColor = basicModel.selectedValue ? HZ_494949Color : HZ_C8C8C8Color;
            break;
        }
        case 10:{
            self.rightLabel.hidden = NO;
            self.rightIV.hidden = NO;
//            self.rightIV.image = MNImage(@"arrow-x");
            self.rightLabel.text = basicModel.selectedValue ? : basicModel.placeholder;
            self.rightLabel.textColor = basicModel.selectedValue ? HZ_494949Color : HZ_C8C8C8Color;
            break;
        }
        case 31:{
            self.rightIDCardTextField.hidden = NO;
            self.rightIDCardTextField.text = basicModel.textFieldValue;
            self.rightIDCardTextField.placeholder = basicModel.placeholder;
            break;
        }
        case 32:{
            self.rightTextField.hidden = NO;
            self.rightTextField.text = basicModel.textFieldValue;
            self.rightTextField.placeholder = basicModel.placeholder;
            self.rightTextField.keyboardType = UIKeyboardTypeDecimalPad;
            break;
        }
        case 33:{
            self.rightTextField.hidden = NO;
            self.rightTextField.text = basicModel.textFieldValue;
            self.rightTextField.placeholder = basicModel.placeholder;
            self.rightTextField.keyboardType = UIKeyboardTypeEmailAddress;
            break;
        }
        case 50:{
            self.rightTextField.hidden = NO;
            self.rightTextField.placeholder = basicModel.placeholder;
            self.rightTextField.text = basicModel.textFieldValue;
            break;
        }
    } 
}

- (void)endEditTextField:(UITextField *)sender{
    
    [_delegate respondsToSelector:@selector(endEditTextField:)] ?
    [_delegate endEditTextField:sender] : nil;
}

@end
