//
//  MNBaseViewController.m
//  HCCF
//
//  Created by Lyh on 2018/2/1.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "MNBaseViewController.h"
#import "HZCommonColor.h"

@interface MNBaseViewController ()
<
UITableViewDelegate,UITableViewDataSource
>


@end

@implementation MNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self baseSetting];
    
    /*
     当translucent = YES，controller中self.view的原点是从导航栏左上角开始计算
     当translucent = NO，controller中self.view的原点是从导航栏左下角开始计算
     */
    self.navigationController.navigationBar.translucent = YES;
    
    [self setupUI];

    [self loadDatas];
    
    if (!_closeNotis) {
        [self receiveNotis];
    }

    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    if ([SVProgressHUD isVisible]) {
//        [SVProgressHUD dismiss];
//    }
}

#pragma mark - 初始化tableView

- (void)setupUI{
    
    //子类继承一定要记得super！不然tableView没了！！
    [self createTableView];
}

- (void)createTableView {

    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 375, 667 - 64) style:UITableViewStyleGrouped];
//    tableView.backgroundColor = [UIColor whiteColor];
    tableView.backgroundColor = HZ_f2f3f7Color;
    tableView.delegate = self;
    tableView.dataSource = self;
//    tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
//    tableView.contentInset = UIEdgeInsetsMake(0, 0, DefaultNaviHeight, 0);
    [self.view addSubview:tableView];
    _tableView = tableView;
    
}


#pragma mark - loadDatas
- (void)loadDatas{
    
}

- (void)baseSetting{
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)receiveNotis{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

@end


/**没有section的tableVIew**/
@implementation MNBaseControllerTypeNoSection

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

@end


/**有section的tableVIew**/
@implementation MNBaseControllerTypeHadSection

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _datas.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_datas[section] count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = HZ_f2f3f7Color;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

@end
