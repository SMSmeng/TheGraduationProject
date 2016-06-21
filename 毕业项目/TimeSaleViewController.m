//
//  TimeSaleViewController.m
//  毕业项目
//
//  Created by 史猛 on 16/6/15.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "TimeSaleViewController.h"
#import "SMSScrolView.h"
#import "SMSBtn.h"
#import "SMSTableViewController.h"
#import "Masonry.h"

@interface TimeSaleViewController ()
@property (strong,nonatomic)        UIScrollView *scrollView;//加载所有控件
@property (strong,nonatomic)        SMSScrolView *smsscroll;//加载第一个滚动广告
@property (strong,nonatomic)        SMSBtn *smsButtonView;//转换双视图
@property (strong,nonatomic)        SMSTableViewController *tableView;//表格新品

@end

@implementation TimeSaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.scrollView];
    
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    __weak typeof(self)     selfWeak = self;
//    self.scrollView.frame = CGRectMake(0, 0, 100, 100);
    [self.smsscroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.view);
        make.left.right.equalTo(selfWeak.view);
        make.height.equalTo(@232);
    }];
    [self.smsButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.smsscroll.mas_bottom);
        make.left.right.equalTo(selfWeak.view);
        make.height.equalTo(@50);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
        _scrollView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
//        _scrollView.contentSize = CGSizeMake(0, self.tableView.frame.origin.y);
        [_scrollView addSubview:self.smsscroll];
        [_scrollView addSubview:self.smsButtonView];
    }
    return _scrollView;
}
- (SMSScrolView *)smsscroll{
    if (!_smsscroll) {
        _smsscroll = [[SMSScrolView alloc]init];
        _smsscroll.contentSize = CGSizeMake(20, 0);
    }
    return _smsscroll;
}
- (SMSBtn *)smsButtonView{
    if (!_smsButtonView) {
        _smsButtonView = [[SMSBtn alloc]init];
    }
    return _smsButtonView;
}
- (SMSTableViewController *)tableView{
    if (!_tableView) {
        _tableView = [[SMSTableViewController alloc]initWithStyle:UITableViewStylePlain];
    }
    return _tableView;
}

@end
