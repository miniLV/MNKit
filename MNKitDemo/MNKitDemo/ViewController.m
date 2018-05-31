//
//  ViewController.m
//  MNKitDemo
//
//  Created by 梁宇航 on 2018/5/29.
//  Copyright © 2018年 梁宇航. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
//屏幕宽高
#define ScreenH  [[UIScreen mainScreen] bounds].size.height
#define ScreenW  [[UIScreen mainScreen] bounds].size.width

@property (nonatomic, weak)UITableView *tableView;
@property (nonatomic, copy)NSArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MNKitDemo";
    
    //setupUI
    [self setupUI];
    
    //datas
    [self loadDatas];
}

#pragma mark - setupUI
- (void)setupUI{
    
    UITableView *tableView = [[UITableView alloc]init];
    CGFloat naviHeight = 64;
    tableView.frame = CGRectMake(0, naviHeight, ScreenW, ScreenH - naviHeight);
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    _tableView = tableView;
}

#pragma mark - loadDatas
- (void)loadDatas{
    
    self.datas = @[@"Demo1 - MNButton",
                   @"Demo2 - MNLabel",
                   @"Demo3 - UIImage+Original"];
    [_tableView reloadData];
}

#pragma mark - <UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    cell.textLabel.text = _datas[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Class cls = NSClassFromString([NSString stringWithFormat:@"Demo%ldViewController",indexPath.row + 1]);
    
    if (cls) {
        [self.navigationController pushViewController:[[cls alloc]init] animated:YES];
    }
}

@end
