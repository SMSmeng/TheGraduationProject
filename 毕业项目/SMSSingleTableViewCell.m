//
//  SMSSingleTableViewCell.m
//  毕业项目
//
//  Created by 史猛 on 16/6/24.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SMSSingleTableViewCell.h"
#import "Masonry.h"

@interface SMSSingleTableViewCell ()


@end
@implementation SMSSingleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.imageName];
        [self addSubview:self.nameLabel];
        [self addSubview:self.titleLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.showpping];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
}


//- (void)layoutSubviews{
//    [super layoutSubviews];
//    __weak typeof(self)     selfWeak = self;
////    [selfWeak.imageName mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.top.equalTo(selfWeak).offset(0);
////        make.left.equalTo(selfWeak).offset(0);
////        make.size.sizeOffset = CGSizeMake(142, 142);
////    }];
//    [selfWeak.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(selfWeak).offset(15);
//        make.left.equalTo(selfWeak).offset(142);
//        make.right.equalTo(selfWeak).offset(-15);
//        make.height.equalTo(@18);
//    }];
//    [selfWeak.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(selfWeak.nameLabel.mas_bottom);
//        make.left.equalTo(selfWeak).offset(147);
//        make.right.equalTo(selfWeak).offset(-17);
//        make.height.equalTo(@45);
//    }];
//    [selfWeak.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(selfWeak.titleLabel.mas_bottom).offset(24);
//        make.left.equalTo(selfWeak).offset(157);
//        make.size.sizeOffset = CGSizeMake(29, 150);
//    }];
//    [selfWeak.showpping mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(selfWeak.titleLabel.mas_bottom).offset(-24);
//        make.left.equalTo(selfWeak.priceLabel.mas_right);
//        make.size.sizeOffset = CGSizeMake(100, 100);
//    }];
//    
//}

- (UIImageView *)imageName{
    if (!_imageName) {
        _imageName = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 140, 140)];
        _imageName.backgroundColor  =[UIColor yellowColor];
    }
    return _imageName;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(165, 20, 200, 20)];
//        _nameLabel.text = @"{海外直邮} 希思黎";
        [_nameLabel setTextAlignment:NSTextAlignmentLeft];
        _nameLabel.font = [UIFont systemFontOfSize:17.0];
        _nameLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    }
    return _nameLabel;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(160, 40, 210, 50)];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:14.0];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(160, 100, 110, 40)];
//        _priceLabel.attributedText = [self attributString];
        
    }
    return _priceLabel;
}
//创建属性字符串
- (NSAttributedString *)attributString{
//    NSString *priceX = [NSString stringWithFormat:@"$%@",self.priceStr];
//    NSString *priceX = self.priceString;
    NSDictionary *priceDic = @{
                               NSFontAttributeName:[UIFont systemFontOfSize:17.0],
                               NSForegroundColorAttributeName : [UIColor redColor],
                               };
    NSAttributedString *priceString = [[NSAttributedString alloc]initWithString:self.priceStr attributes:priceDic];
//    NSString *priceY = [NSString stringWithFormat:@"$%@",self.priceString];
    NSDictionary *priceDis = @{
                               NSFontAttributeName : [UIFont systemFontOfSize:12.0],
                               NSForegroundColorAttributeName : [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0],
                               NSStrikethroughStyleAttributeName : [NSNumber numberWithInteger:NSUnderlineStyleSingle]
                               };
    NSAttributedString *priceStrin = [[NSAttributedString alloc]initWithString:self.priceString attributes:priceDis];
    NSMutableAttributedString *price = [[NSMutableAttributedString alloc]init];
    [price insertAttributedString:priceString atIndex:0];
    [price insertAttributedString:priceStrin atIndex:priceString.length];
    
    return price;
}
- (UIImageView *)showpping{
    if (!_showpping) {
        _showpping = [[UIImageView alloc]initWithFrame:CGRectMake(270, 100, 45, 45)];
    }
    return _showpping;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
