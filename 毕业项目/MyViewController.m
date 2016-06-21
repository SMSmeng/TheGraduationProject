//
//  MyViewController.m
//  毕业项目
//
//  Created by 史猛 on 16/6/15.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "MyViewController.h"
#import "Masonry.h"
#import "SMSViewController.h"

@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic)        UIImageView *imageBack;
@property (strong,nonatomic)        UIButton *liefButton;
@property (strong,nonatomic)        UIButton *rightButton;
@property (strong,nonatomic)        UITableView *tableView;
@property (strong,nonatomic)        NSArray *tableViewArray;
@property (strong,nonatomic)        UILabel *cellLabel;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.imageBack];
    [self.view addSubview:self.liefButton];
    [self.view addSubview:self.rightButton];
    
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    __weak typeof(self)     selfWeak = self;
    [selfWeak.imageBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(selfWeak.view);
        make.height.equalTo(@130);
    }];
    [selfWeak.liefButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(selfWeak.imageBack).offset(107);
        make.centerY.equalTo(selfWeak.imageBack);
        //            make.height.equalTo(@15);
        make.size.sizeOffset = CGSizeMake(35, 15);
    }];
    [selfWeak.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(selfWeak.imageBack).offset(-107);
        make.centerY.equalTo(selfWeak.imageBack);
        make.size.sizeOffset = CGSizeMake(35, 15);
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableViewArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *table = @"tableVIewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:table];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:table];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    NSDictionary *dic = self.tableViewArray[indexPath.row];
    cell.textLabel.text = dic[@"title"];
    cell.imageView.image = [UIImage imageNamed:dic[@"image"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 3) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.accessoryView = self.cellLabel;
        
    }
    return cell;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 130, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
    }
    return _tableView;
}
- (NSArray *)tableViewArray{
    if (!_tableViewArray) {
        _tableViewArray = [[NSArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"woDe" ofType:@"plist"]];
    }
    return _tableViewArray;
}

- (UIImageView *)imageBack{
    if (!_imageBack) {
        _imageBack = [[UIImageView alloc]init];
        _imageBack.image = [UIImage imageNamed:@"我的背景"];
    }
    return _imageBack;
}
- (UIButton *)liefButton{
    if (!_liefButton) {
        _liefButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_liefButton setTitle:@"登录" forState:UIControlStateNormal];
        [_liefButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_liefButton addTarget:self action:@selector(pushSMSViewController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _liefButton;
}
- (UILabel *)cellLabel{
    if (!_cellLabel) {
        _cellLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 120, 40)];
        _cellLabel.text = @"400-6010-545";
        _cellLabel.font = [UIFont systemFontOfSize:15.0];
    }
    return _cellLabel;
}
- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_rightButton setTitle:@"注册" forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(show) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _rightButton;
}
- (void)pushSMSViewController{
//    NSLog(@"进入视图");
    SMSViewController *smsVC = [[SMSViewController alloc]init];
    smsVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:smsVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
