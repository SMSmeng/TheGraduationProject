//
//  thirdView.m
//  毕业项目
//
//  Created by 史猛 on 16/6/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "thirdView.h"
#import "Masonry.h"     /**设置固定位置的第三方库*/

typedef void(^loginSuccess)(NSDictionary *returnBlock);
typedef void(^loginError)();
@interface thirdView ()
@property (strong,nonatomic)        UILabel *label;
@property (strong,nonatomic)        UILabel *labelYijianDenglu;

@end
@implementation thirdView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.label];
        [self addSubview:self.labelYijianDenglu];
        [self addSubview:self.qqBtn];
        [self addSubview:self.wxBtn];
        [self addSubview:self.wbBtn];
    }
    return self;
}

#pragma mark - 给控件设置位置
- (void)layoutSubviews{
    [super layoutSubviews];
//    self.label.frame = CGRectMake(16, 7, CGRectGetWidth(self.frame)-16, 1);
//    self.labelYijianDenglu.frame = CGRectMake(self.frame.size.width/2-50, 0, 100, 16);
    __weak typeof(self)     selfWeak = self;
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak).offset(7);
        make.left.equalTo(selfWeak).offset(16);
        make.right.equalTo(selfWeak).offset(-16);
        make.height.equalTo(@1);
    }];
    [selfWeak.labelYijianDenglu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak);
        make.centerX.equalTo(selfWeak);
        make.size.sizeOffset = CGSizeMake(100, 17);
    }];
    [selfWeak.qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.labelYijianDenglu.mas_bottom).offset(20);
        make.left.equalTo(selfWeak).offset(70);
        make.size.sizeOffset = CGSizeMake(45, 45);
    }];
    [selfWeak.wxBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.labelYijianDenglu.mas_bottom).offset(20);
        make.centerX.equalTo(selfWeak);
        make.size.sizeOffset = CGSizeMake(45, 45);
    }];
    [selfWeak.wbBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.labelYijianDenglu.mas_bottom).offset(20);
        make.right.equalTo(selfWeak).offset(-70);
        make.size.sizeOffset = CGSizeMake(45, 45);
    }];
}


- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        _label.text = @"____________________________________";
    }
    return _label;
}
- (UILabel *)labelYijianDenglu{
    if (!_labelYijianDenglu) {
        _labelYijianDenglu = [[UILabel alloc]init];
        _labelYijianDenglu.text = @"一键登录";
        _labelYijianDenglu.textAlignment = NSTextAlignmentCenter;
        _labelYijianDenglu.font = [UIFont systemFontOfSize:14.0];
        [_labelYijianDenglu setTextColor:[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0]];
        _labelYijianDenglu.backgroundColor = [UIColor whiteColor];
    }
    return _labelYijianDenglu;
}
- (UIButton *)qqBtn{
    if (!_qqBtn) {
        _qqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _qqBtn.backgroundColor = [UIColor blueColor];
        [_qqBtn setImage:[UIImage imageNamed:@"登录界面qq登陆"] forState:UIControlStateNormal];
    }
    return _qqBtn;
}
- (UIButton *)wxBtn{
    if (!_wxBtn) {
        _wxBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _wxBtn.backgroundColor = [UIColor greenColor];
        [_wxBtn setImage:[UIImage imageNamed:@"登录界面微信登录"] forState:UIControlStateNormal];
    }
    return _wxBtn;
}
- (UIButton *)wbBtn{
    if (!_wbBtn) {
        _wbBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _wbBtn.backgroundColor = [UIColor redColor];
        [_wbBtn setImage:[UIImage imageNamed:@"登陆界面微博登录"] forState:UIControlStateNormal];
    }
    return _wbBtn;
}



@end
