//
//  CMAddCustomerController.m
//  HCCF
//
//  Created by Lyh on 2018/3/21.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "CMAddCustomerController.h"
#import "CMAddCustomDatas.h"
#import "CMAddCustomerCell.h"
#import "CMAddressCell.h"
//#import "HZJGModel.h"
#import "LFbasicCellModel.h"
//#import "MNZJUsefulPickerTools.h"
//#import "MNshowXHDateClass.h"
#import "HZCommonColor.h"

@interface CMAddCustomerController ()
<
CMAddressDelegate,
CMAddCustomerDelegate
>
@end

@implementation CMAddCustomerController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)baseSetting{
    [super baseSetting];
    self.title = @"添加客户";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark - loadDatas
- (void)loadDatas{
    _datas = [CMAddCustomDatas handleDatas];
    [_tableView reloadData];
}

#pragma mark - setupUI
- (void)setupUI{
    [super setupUI];
    _tableView.backgroundColor = HZ_f2f3f7Color;
    
    [self setupRightItem];
}

- (void)setupRightItem{

    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    [rightBtn setTitle:@"完成" forState:UIControlStateNormal];
    [rightBtn setTitleColor:HZ_00BC71Color forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(clickRigthItem) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * rightBarBtn = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = 5;
    
    //将两个BarButtonItem都返回给NavigationItem
    self.navigationItem.rightBarButtonItems = @[rightBarBtn,spaceItem];
}

- (void)clickRigthItem{
    
    //创建客户
    [CMAddCustomDatas postDatas:_datas];
}

#pragma mark - privateDelegate
- (void)endEditAddressTextView:(UITextView *)sender{
    NSInteger section = sender.tag / 100;
    NSInteger row = sender.tag % 100;
    LFbasicCellModel *model = _datas[section][row];
    model.textFieldValue = sender.text;
//    kRefreshTableView(_tableView, row, section);
    [_tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:section]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)endEditTextField:(UITextField *)sender{
    NSInteger section = sender.tag / 100;
    NSInteger row = sender.tag % 100;
    LFbasicCellModel *model = _datas[section][row];
    model.textFieldValue = sender.text;
    [_tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:section]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - <tableviewDelegate>
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LFbasicCellModel *model = _datas[indexPath.section][indexPath.row];
    if (model.type == 11) {
        
        CMAddressCell *cell = [CMAddressCell createCellWithTableView:tableView];
        
        cell.basicIndexPath = indexPath;
        cell.basicModel = model;
        cell.delegate = self;
        return cell;
    }
    CMAddCustomerCell *cell = [self getCellWithID:model.type
                                        indexPath:indexPath
                                            model:model];
    cell.basicIndexPath = indexPath;
    cell.basicModel = model;
    cell.delegate = self;
    return cell;
}

- (CMAddCustomerCell *)getCellWithID:(NSInteger)typeId
                           indexPath:(NSIndexPath *)indexPath
                               model:(LFbasicCellModel *)model{
    
    NSString *reuseIdentifier = [NSString stringWithFormat:@"%ld", (long)typeId];
    CMAddCustomerCell *cell = [CMAddCustomerCell createReuseIdentifier:reuseIdentifier
                                                         WithTableView:_tableView];
    cell.basicIndexPath = indexPath;
    cell.basicModel = model;
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LFbasicCellModel *model = _datas[indexPath.section][indexPath.row];
    if (model.type == 11){
        return 64;
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)addZJProvicePickerView:(LFbasicCellModel *)model
                       section:(NSInteger)section
                           row:(NSInteger)row{
    
}

@end
