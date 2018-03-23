//
//  MNBaseViewController.h
//  HCCF
//
//  Created by Lyh on 2018/2/1.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MNBaseViewController : UIViewController
{
    UITableView *_tableView;

    NSArray *_datas;
}

///是否关闭-viewDidLoad中的 接收通知方法
@property (nonatomic, assign, getter=isCloseNotis) BOOL closeNotis;

- (void)baseSetting;

- (void)setupUI;

- (void)loadDatas;

- (void)receiveNotis;


///UITableViewStyleGrouped 类型的tableView
- (void)createTableView;

///TableViewStylePlain 类型的tableView
- (void)createTableViewStylePlain;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

/*数据结构是 - @[],没有section的tableVIew*/
@interface MNBaseControllerTypeNoSection : MNBaseViewController

@end

/*数据结构是 - @[@[]],有section的tableVIew*/
@interface MNBaseControllerTypeHadSection : MNBaseViewController

@end
