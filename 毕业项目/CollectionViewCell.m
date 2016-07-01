//
//  CollectionViewCell.m
//  毕业项目
//
//  Created by 史猛 on 16/6/27.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "CollectionViewCell.h"
#import "Masonry/Masonry.h"
@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.imageV];
        [self addSubview:self.labelTitle];
    }
    return self;
}
- (void)layoutSubviews{
//    [self addSubview:self.imageV];
    __weak typeof(self)     sel = self;
    [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sel).offset(20);
        make.top.equalTo(sel).offset(10);
        make.right.equalTo(sel).offset(-20);
        make.bottom.equalTo(sel).offset(-30);
    }];
    [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(sel);
        make.height.equalTo(@30);
    }];
}
- (UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [[UIImageView alloc]init];
    }
    return _imageV;
}
- (UILabel *)labelTitle{
    if (!_labelTitle) {
        _labelTitle = [[UILabel alloc]init];
        _labelTitle.font = [UIFont systemFontOfSize:15.0];
        _labelTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _labelTitle;
}




@end
