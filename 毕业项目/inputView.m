//
//  inputView.m
//  毕业项目
//
//  Created by 史猛 on 16/6/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "inputView.h"
#import "Masonry.h"

@interface inputView ()

@end
@implementation inputView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.backLabel];
        [self addSubview:self.lineLabel];
        [self addSubview:self.nameField_1];
        [self addSubview:self.passField_2];
        [self addSubview:self.dengLuBtn];
        [self addSubview:self.chuCeBtn];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [weakSelf.backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).offset(15);
        make.left.right.equalTo(weakSelf);
        make.height.equalTo(@88);
    }];
    [weakSelf.nameField_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel);
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.backLabel.mas_right).offset(-15);
        make.height.equalTo(@44);
    }];
    [weakSelf.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.backLabel.mas_right).offset(-15);
        make.top.equalTo(weakSelf.backLabel.mas_centerY);
    }];
    [weakSelf.passField_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.backLabel);
        make.left.equalTo(weakSelf.backLabel).offset(15);
        make.right.equalTo(weakSelf.backLabel).offset(-15);
        make.height.equalTo(@44);
    }];
    [weakSelf.dengLuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel.mas_bottom).offset(15);
        make.left.equalTo(weakSelf).offset(16);
        make.right.equalTo(weakSelf).offset(-16);
        make.height.equalTo(@35);
    }];
    [weakSelf.chuCeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.dengLuBtn.mas_bottom).offset(15);
        make.right.equalTo(weakSelf).offset(-15);
        make.size.sizeOffset = CGSizeMake(100, 40);
    }];
    
}


#pragma mark - 
- (UILabel *)backLabel{
    if (!_backLabel) {
        _backLabel = [[UILabel alloc]init];
        _backLabel.backgroundColor = [UIColor whiteColor];
        _backLabel.layer.masksToBounds = YES;
        _backLabel.layer.borderColor = [[UIColor yellowColor] CGColor];
        _backLabel.layer.borderWidth = 0.5f;
    }
    return _backLabel;
}
- (UITextField *)nameField_1{
    if (!_nameField_1) {
        _nameField_1 = [[UITextField alloc]init];
        _nameField_1.placeholder = @"请输入手机号";
        _nameField_1.keyboardType = UIKeyboardTypeNumberPad;
        _nameField_1.borderStyle = UITextBorderStyleNone;
    }
    return _nameField_1;
}
- (UITextField *)passField_2{
    if (!_passField_2) {
        _passField_2 = [[UITextField alloc]init];
        _passField_2.placeholder = @"请输入密码";
        _passField_2.secureTextEntry = YES;
        
    }
    return _passField_2;
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    }
    return _lineLabel;
}
- (UIButton *)dengLuBtn{
    if (!_dengLuBtn) {
        _dengLuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_dengLuBtn setImage:[UIImage imageNamed:@"登录界面登录按钮"] forState:UIControlStateNormal];
//        [_dengLuBtn addTarget:self action:@selector(delegeteCreate) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dengLuBtn;
}
- (UIButton *)chuCeBtn{
    if (!_chuCeBtn) {
        _chuCeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _chuCeBtn.backgroundColor = [UIColor blueColor];
        [_chuCeBtn setTitle:@"免费注册" forState:UIControlStateNormal];
        _chuCeBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_chuCeBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return _chuCeBtn;
}
//- (void)delegeteCreate{
//    if ([self respondsToSelector:@selector(PushViewContronllerWithDictionary:)]) {
//        [[NSUserDefaults standardUserDefaults] objectForKey:@"ISLOGIN"]
//        self.deleGate PushViewContronllerWithDictionary:<#(NSDictionary *)#>
//    }
//    
//}




@end
