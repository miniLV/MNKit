//
//  CMAddCustomerCell.h
//  HCCF
//
//  Created by Lyh on 2018/3/21.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFSimpleRightCell.h"

@protocol CMAddCustomerDelegate <NSObject>

- (void)endEditTextField:(UITextField *)sender;

@end

@interface CMAddCustomerCell : LFSimpleRightCell

@property (nonatomic, weak) id<CMAddCustomerDelegate> delegate;

@end
