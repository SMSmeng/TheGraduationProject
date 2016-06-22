//
//  VerifiViewController.m
//  毕业项目
//
//  Created by 史猛 on 16/6/22.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "VerifiViewController.h"
#import "Masonry.h"

@interface VerifiViewController ()
@property (strong,nonatomic)        UILabel *topLabel;
@property (strong,nonatomic)        UILabel *backLabel;
@property (strong,nonatomic)        UITextField *CAPTCHA;
@property (strong,nonatomic)        UILabel *daojishiLabel;
@property (strong,nonatomic)        UIButton *zhuceBtn;
@end

@implementation VerifiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topLabel];
    [self.view addSubview:self.backLabel];
    [self.view addSubview:self.CAPTCHA];
    [self.view addSubview:self.daojishiLabel];
    [self.view addSubview:self.zhuceBtn];
    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    __weak typeof (self)        selfWeak = self;
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.view).offset(5);
        make.left.equalTo(selfWeak.view).offset(15);
        make.width.equalTo(@200);
        make.height.equalTo(@35);
    }];
    [selfWeak.backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.topLabel.mas_bottom);
        make.left.right.equalTo(selfWeak.view);
        make.height.mas_equalTo(43);
    }];
    [selfWeak.CAPTCHA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.backLabel);
        make.left.equalTo(selfWeak.backLabel).offset(15);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(selfWeak.backLabel);
    }];
    [selfWeak.daojishiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.backLabel);
        make.right.equalTo(selfWeak.backLabel);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(selfWeak.backLabel);
    }];
    [selfWeak.zhuceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.backLabel.mas_bottom).offset(50);
        make.centerX.equalTo(selfWeak.view);
        make.size.sizeOffset = CGSizeMake(280, 40);
        
    }];
    
}
- (UILabel *)topLabel{
    if (!_topLabel) {
        _topLabel = [[UILabel alloc]init];
        _topLabel.text = @"验证码已经发到 ＋86";
        _topLabel.font = [UIFont systemFontOfSize:14.0];
        _topLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
        _topLabel.backgroundColor = [UIColor whiteColor];
    }
    return _topLabel;
}
- (UILabel *)backLabel{
    if (!_backLabel ) {
        _backLabel = [[UILabel alloc]init];
        _backLabel.backgroundColor = [UIColor whiteColor];
    }
    return _backLabel;
}
- (UITextField *)CAPTCHA{
    if (!_CAPTCHA) {
        _CAPTCHA = [[UITextField alloc]init];
        _CAPTCHA.borderStyle = UITextBorderStyleNone;
        
    }
    return _CAPTCHA;
}
- (UILabel *)daojishiLabel{
    if (!_daojishiLabel) {
        _daojishiLabel = [[UILabel alloc]init];
        _daojishiLabel.text = @"59秒后重试";
        _daojishiLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
    }
    return _daojishiLabel;
}
- (UIButton *)zhuceBtn{
    if (!_zhuceBtn) {
        _zhuceBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _zhuceBtn.backgroundColor = [UIColor blueColor];
    }
    return _zhuceBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
