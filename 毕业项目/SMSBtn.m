//
//  SMSBtn.m
//  毕业项目
//
//  Created by 史猛 on 16/6/17.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SMSBtn.h"
#import "Masonry.h"

#define VIEW_WIDTH ([UIScreen mainScreen].bounds.size.width)
@interface SMSBtn ()

@end
@implementation SMSBtn

- (instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.product];
        [self addSubview:self.brand];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self)     selfWeak = self;
    [_product mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(selfWeak);
        make.bottom.equalTo(selfWeak);
        make.width.mas_equalTo(VIEW_WIDTH/2);
    }];
    [_brand mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(selfWeak);
        make.bottom.equalTo(selfWeak);
        make.width.mas_equalTo(VIEW_WIDTH/2);
    }];
    
    
}

- (UIButton *)product{
    if (!_product) {
        _product = [UIButton buttonWithType:UIButtonTypeSystem];
        [_product setImage:[UIImage imageNamed:@"新品团未选中"] forState:UIControlStateNormal];
        [_product setImage:[UIImage imageNamed:@"新品团选中"] forState:UIControlStateSelected];
        [_product setImageEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
        [_product setTitle:@"新品团购" forState:UIControlStateNormal];
        [_product setTitleColor:[UIColor colorWithRed:67/255.0 green:182/255.0 blue:241/255.0 alpha:1.0] forState:UIControlStateNormal];
        [_product setTitleColor:[UIColor colorWithRed:239/255.0 green:101/255.0 blue:48/255.0 alpha:1.0] forState:UIControlStateSelected];
    }
    return _product;
}
- (UIButton *)brand{
    if (!_brand) {
        _brand = [UIButton buttonWithType:UIButtonTypeSystem];
        [_brand setImage:[UIImage imageNamed:@"品牌团未选中"] forState:UIControlStateNormal];
        [_brand setImage:[UIImage imageNamed:@"品牌团选中"] forState:UIControlStateSelected];
        [_brand setImageEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
        [_brand setTitle:@"品牌团购" forState:UIControlStateNormal];
        [_brand setTitleColor:[UIColor colorWithRed:67/255.0 green:182/255.0 blue:241/255.0 alpha:1.0] forState:UIControlStateNormal];
        [_brand setTitleColor:[UIColor colorWithRed:230/255.0 green:101/255.0 blue:48/255.0 alpha:1.0] forState:UIControlStateSelected];
    }
    return _brand;
}


@end
