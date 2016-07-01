//
//  SMSGreoupTableViewCell.m
//  毕业项目
//
//  Created by 史猛 on 16/6/24.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SMSGreoupTableViewCell.h"
#import "Masonry.h"

@interface SMSGreoupTableViewCell ()

@end
@implementation SMSGreoupTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.imageV];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
}

-(UIImageView *)imageV
{
    if (!_imageV) {
        _imageV =[[UIImageView alloc]initWithFrame:CGRectMake(5, 0, 365, 150)];
    }
    return _imageV;
}

//-(void)layoutSubviews
//{
//    
//    
//    __weak typeof(self)weakSelf = self;
//    
//    
//    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.left.mas_equalTo(weakSelf.contentView.mas_left).offset(10);
//        
//        make.right.mas_equalTo(weakSelf.contentView.mas_right).offset(-10);
//        
//        make.top.mas_equalTo(weakSelf.contentView.mas_top);
//        
//        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).offset(-10);
//        
//    }];
//    
//
//}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
