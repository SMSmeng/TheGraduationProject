//
//  chuceView.m
//  毕业项目
//
//  Created by 史猛 on 16/6/22.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "chuceView.h"
#import "Masonry.h"

@interface chuceView ()
@property (strong,nonatomic)        UILabel *topLabel;
@property (strong,nonatomic)        UILabel *backLabel;
@property (strong,nonatomic)        UITextField *nameTextField;
@property (strong,nonatomic)        UILabel *lineLabel;
@property (strong,nonatomic)        UITextField *passTextField;
@property (strong,nonatomic)        UIButton *dengLuBtn;
@end
@implementation chuceView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.topLabel];
        [self addSubview:self.backLabel];
        [self addSubview:self.nameTextField];
        [self addSubview:self.lineLabel];
        [self addSubview:self.passTextField];
        [self addSubview:self.toBtn];
        [self addSubview:self.dengLuBtn];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self)     selfWeak = self;
    [selfWeak.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak);
        make.left.equalTo(selfWeak).offset(15);
        make.height.equalTo(@35);
        make.width.equalTo(@200);
    }];
    [selfWeak.backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.topLabel.mas_bottom);
        make.left.right.equalTo(selfWeak);
        make.height.equalTo(@88);
    }];
    [selfWeak.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.backLabel);
        make.left.equalTo(selfWeak.backLabel).offset(15);
        make.right.equalTo(selfWeak.backLabel).offset(-15);
        make.height.equalTo(@44);
    }];
    [selfWeak.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.backLabel.mas_centerY);
        make.left.equalTo(selfWeak.backLabel).offset(15);
        make.right.equalTo(selfWeak.backLabel).offset(-15);
        make.height.equalTo(@1);
    }];
    [selfWeak.passTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(selfWeak.backLabel);
        make.left.equalTo(selfWeak.backLabel).offset(15);
        make.right.equalTo(selfWeak.backLabel).offset(-15);
        make.height.equalTo(@44);
    }];
    [selfWeak.toBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.backLabel.mas_bottom).offset(15);
        make.left.equalTo(selfWeak).offset(15);
        make.right.equalTo(selfWeak).offset(-15);
        make.height.equalTo(@35);
    }];
    [selfWeak.dengLuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.toBtn.mas_bottom).offset(23);
        make.right.equalTo(selfWeak).offset(-5);
        make.size.sizeOffset = CGSizeMake(45, 15);
    }];
    
}

- (UILabel *)topLabel{
    if (!_topLabel) {
        _topLabel = [[UILabel alloc]init];
        _topLabel.backgroundColor = [UIColor whiteColor];
        _topLabel.text = @"请输入手机号码注册新用户";
        _topLabel.font = [UIFont systemFontOfSize:14.0];
        _topLabel.textColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    }
    return _topLabel;
}
- (UILabel *)backLabel{
    if (!_backLabel) {
        _backLabel = [[UILabel alloc]init];
        _backLabel.backgroundColor = [UIColor whiteColor];
        _backLabel.layer.masksToBounds = YES;
        _backLabel.layer.borderWidth = 0.5f;
        _backLabel.layer.borderColor = [[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0] CGColor];
        
    }
    return _backLabel;
}
- (UITextField *)nameTextField{
    if (!_nameTextField) {
        _nameTextField = [[UITextField alloc]init];
        _nameTextField.placeholder = @"请输入手机号";
        _nameTextField.borderStyle = UITextBorderStyleNone;
        _nameTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _nameTextField;
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel.backgroundColor = [UIColor colorWithRed:215/255.0 green:215/255.0 blue:215/255.0 alpha:1.0];
    }
    return _lineLabel;
}
- (UITextField *)passTextField{
    if (!_passTextField) {
        _passTextField = [[UITextField alloc]init];
        _passTextField.placeholder = @"请输入密码";
        _passTextField.secureTextEntry = YES;
    }
    return _passTextField;
}
- (UIButton *)toBtn{
    if (!_toBtn) {
        _toBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//        _toBtn.layer.masksToBounds = YES;
//        _toBtn.layer.cornerRadius = 0.5f;
//        [_toBtn setImage:[UIImage imageNamed:@"注册界面下一步按钮"] forState:UIControlStateNormal];
        [_toBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [_toBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _toBtn.backgroundColor = [UIColor colorWithRed:100/255.0 green:180/255.0 blue:240/255.0 alpha:1.0];
    }
    return _toBtn;
}
- (UIButton *)dengLuBtn{
    if (!_dengLuBtn) {
        _dengLuBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_dengLuBtn setTitle:@"去登录" forState:UIControlStateNormal];
        [_dengLuBtn setTitleColor:[UIColor colorWithRed:100/255.0 green:180/255.0 blue:240/255.0 alpha:1.0] forState:UIControlStateNormal];
        _dengLuBtn.backgroundColor = [UIColor whiteColor];
    }
    return _dengLuBtn;
}











@end
