//
//  verifiView.m
//  毕业项目
//
//  Created by 史猛 on 16/6/23.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "verifiView.h"
#import "Masonry.h"


@interface verifiView ()<UITextFieldDelegate>
@property (strong,nonatomic)        UILabel *topLabel;
@property (strong,nonatomic)        UILabel *backLabel;

@end
@implementation verifiView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.topLabel];
        [self addSubview:self.backLabel];
        [self addSubview:self.CAPTCHA];
        [self addSubview:self.daojishiLabel];
        [self addSubview:self.zhuceBtn];
        [self addSubview:self.chongXinFasong];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof (self)        selfWeak = self;
    [selfWeak.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak).offset(5);
        make.left.equalTo(selfWeak).offset(15);
        make.width.equalTo(@200);
        make.height.equalTo(@35);
    }];
    [selfWeak.backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.topLabel.mas_bottom);
        make.left.right.equalTo(selfWeak);
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
        make.centerX.equalTo(selfWeak);
        make.size.sizeOffset = CGSizeMake(280, 40);
    }];
    [selfWeak.chongXinFasong mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.zhuceBtn.mas_bottom).offset(30);
        make.centerX.equalTo(selfWeak);
        make.size.sizeOffset = CGSizeMake(130, 40);
    }];
    
    
}

- (UIButton *)chongXinFasong{
    if (!_chongXinFasong) {
        _chongXinFasong = [UIButton buttonWithType:UIButtonTypeSystem];
        _chongXinFasong.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0];
        [_chongXinFasong setTitle:@"重新发送验证码" forState:UIControlStateNormal];
        [_chongXinFasong setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    return _chongXinFasong;
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
        _CAPTCHA.placeholder = @"请输入验证码";
        _CAPTCHA.delegate = self;
    }
    return _CAPTCHA;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (self.CAPTCHA.text.length == 4) {
        self.zhuceBtn.selected = YES;
        self.zhuceBtn.backgroundColor = [UIColor colorWithRed:67/255.0 green:180/255.0 blue:240/255.0 alpha:1.0];
        self.zhuceBtn.userInteractionEnabled = YES;
    }else{
        self.zhuceBtn.selected = NO;
        self.zhuceBtn.backgroundColor = [UIColor lightGrayColor];
        self.zhuceBtn.userInteractionEnabled = NO;
    }
    return YES;
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
//        _zhuceBtn.backgroundColor = [UIColor blueColor];
        [_zhuceBtn setTitle:@"  注  册 ®️" forState:UIControlStateNormal];
        
    }
    return _zhuceBtn;
}

@end
