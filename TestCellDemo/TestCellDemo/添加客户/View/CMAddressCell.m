  //
//  CMAddressCell.m
//  HCCF
//
//  Created by Lyh on 2018/3/21.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "CMAddressCell.h"
#import "YZInputView.h"
#import "CMConst.h"
#import "LFLabel.h"
#import "HZCommonColor.h"
#import "HZCommonFont.h"
#import <Masonry.h>
#import "LFbasicCellModel.h"

@interface CMAddressCell()
<UITextViewDelegate>
@end

@implementation CMAddressCell{
    UILabel *_titleLabel;
    YZInputView *_addressTextView;
}

- (void)createControls{
    
    UILabel *titleLabel = [LFLabel labelWithFont:HZ_15FontSize color:HZ_777777Color];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(15);
    }];
    _titleLabel = titleLabel;

    //addressTextView
    YZInputView *addressTextView = [[YZInputView alloc]init];
    addressTextView.maxNumberOfLines = 2;
    addressTextView.font = HZ_15FontSize;
    addressTextView.textColor = HZ_494949Color;
    addressTextView.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:addressTextView];
    [addressTextView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(CMAddressTextViewLeftMargin);
        make.right.mas_equalTo(-CMAddressTextViewRightMargin);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-10);
    }];
    addressTextView.delegate = self;
#warning mark - 不知道为啥刷新当前cell第一次创建（alloc init）不进入fuyongchi- 会进入 'createControls' - 目测RootCell init方法需要优化
    /**
     暂时用固定plachoder，如果需要复用外部传入的时候再解决这个问题
     */
    addressTextView.placeholder = @"请输入详细地址(至少6个汉字)";
    addressTextView.placeholderColor = HZ_C8C8C8Color;
//    addressTextView.text = @"start";
    _addressTextView = addressTextView;
    
    
}

- (void)setBasicModel:(LFbasicCellModel *)basicModel{
    
    NSInteger tag = self.basicIndexPath.section * 100 + self.basicIndexPath.row;
    _addressTextView.tag = tag;
    _titleLabel.text = basicModel.titleLabel;
    _addressTextView.text = basicModel.textFieldValue;
//    _addressTextView.text = @"setModel";
    
}


#pragma mark - <UITextViewDelegate>
- (BOOL)textViewShouldEndEditing:(UITextView *)sender{
    
    return YES;
}
- (void)textViewDidEndEditing:(UITextView *)sender{

    [_delegate respondsToSelector:@selector(endEditAddressTextView:)] ?
    [_delegate endEditAddressTextView:sender] : nil;
}

@end
