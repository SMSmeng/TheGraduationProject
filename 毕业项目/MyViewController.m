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
#import "RegisteredViewController.h"

@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic)        UIImageView *imageBack;
@property (strong,nonatomic)        UIButton *liefButton;
@property (strong,nonatomic)        UIButton *rightButton;
@property (strong,nonatomic)        NSArray *tableViewArray;
@property (strong,nonatomic)        UILabel *cellLabel;
@property (strong,nonatomic)        NSDictionary *dicData;
@property (strong,nonatomic)        UILabel *nameLabel;
@property (strong,nonatomic)        UILabel *memberLabel;
@property (strong,nonatomic)        UILabel *headLabel;
@property (strong,nonatomic)        UIButton *tuichuLabel;
@property (strong,nonatomic)        UITableView *tableView;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.imageBack];
    [self.view addSubview:self.liefButton];
    [self.view addSubview:self.rightButton];
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:239/255.0 blue:244/255.0 alpha:1.0];
    [self.view addSubview:self.tuichuLabel];
}
- (void)showLandingAndLoginBtn:(NSDictionary *)dic{
    if (dic.count != 0) {
        _tuichuLabel.hidden = NO;
    }else{
        _tuichuLabel.hidden = YES;
    }
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
    [selfWeak.tuichuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.tableView.mas_bottom).offset(-50);
        make.centerX.equalTo(selfWeak.view);
        make.size.sizeOffset = CGSizeMake(250, 40);
    }];
}


#pragma mark - tableView协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:@"ISLOGIN"];
    if (dic.count != 0) {
        return 6;
    }else{
        return 4;
    }
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
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 130, CGRectGetWidth(self.view.frame), 370) style:UITableViewStyleGrouped];
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
- (NSDictionary *)dicData{
    if (!_dicData) {
        _dicData = [[NSUserDefaults standardUserDefaults] objectForKey:@"ISLOGIN"];
    }
    return _dicData;
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
- (UIButton *)tuichuLabel{
    if (!_tuichuLabel) {
        
        _tuichuLabel = [UIButton buttonWithType:UIButtonTypeSystem];
        _tuichuLabel.backgroundColor = [UIColor colorWithRed:114/255.0 green:200/255.0 blue:245/255.0 alpha:1.0];
        [_tuichuLabel setTitle:@"退 出 登 录" forState:UIControlStateNormal];
        [_tuichuLabel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _tuichuLabel.layer.masksToBounds = YES;
        _tuichuLabel.layer.contentsScale = 0.5f;
        [_tuichuLabel addTarget:self action:@selector(showTuiChuDengLu) forControlEvents:UIControlEventTouchUpInside];
//        _tuichuLabel.hidden = YES;
    }
    return _tuichuLabel;
}
- (void)showTuiChuDengLu{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"ISLOGIN"];
    
//    [self.dicData ]
    NSLog(@"退出登录————————————————");
    [self.tableView reloadData];
    
}
- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_rightButton setTitle:@"注册" forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(pushRegisteredViewContrller) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _rightButton;
}
- (void)pushSMSViewController{
//    NSLog(@"进入视图");
    SMSViewController *smsVC = [[SMSViewController alloc]init];
    smsVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:smsVC animated:YES];
    
    
}
- (void)pushRegisteredViewContrller{
    RegisteredViewController *regiVC = [[RegisteredViewController alloc]init];
    regiVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:regiVC animated:YES];
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 50, 100, 30)];
        
    }
    return _nameLabel;
}
- (UILabel *)memberLabel{
    if (!_memberLabel) {
        _memberLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 80, 120, 30)];
        
    }
    return _memberLabel;
}
- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 100)];
        
    }
    return _headLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}



@end
