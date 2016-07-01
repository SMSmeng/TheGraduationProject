//
//  SMSViewTop.m
//  毕业项目
//
//  Created by 史猛 on 16/6/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SMSViewTop.h"

@interface SMSViewTop ()
@property (strong,nonatomic)        UILabel *labelTop;
@property (strong,nonatomic)        UILabel *labelPrice;
@property (strong,nonatomic)        UILabel *labelLine;
@property (strong,nonatomic)        UILabel *labelTitle;
@property (strong,nonatomic)        UILabel *labelWideLine;

@end
@implementation SMSViewTop

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (UILabel *)labelTop{
    if (!_labelTop) {
        _labelTop = [[UILabel alloc]init];
        _labelTop.textAlignment = NSTextAlignmentCenter;
        _labelTop.font = [UIFont boldSystemFontOfSize:16.0];
        _labelTop.textColor = [UIColor blackColor];
    }
    return _labelTop;
}
- (UILabel *)labelPrice{
    if (!_labelPrice) {
        _labelPrice = [[UILabel alloc]init];
        _labelPrice.attributedText = [self labelAttributedText];
    }
    return _labelPrice;
}
- (NSAttributedString *)labelAttributedText{
    NSString *str1 = [NSString stringWithFormat:@"$%d",321];
    NSDictionary *dic1 = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:18.0],
                           NSForegroundColorAttributeName : [UIColor colorWithRed:220/255.0 green:40/255.0 blue:4/255.0 alpha:1.0]
                           };
    NSAttributedString *attStr1 = [[NSAttributedString alloc]initWithString:str1 attributes:dic1];
    NSString *str2 = [NSString stringWithFormat:@"$%d",228];
    NSDictionary *dic2 = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:14.0],
                           NSForegroundColorAttributeName : [UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1.0]
                           };
    NSAttributedString *attStr2 = [[NSAttributedString alloc]initWithString:str2 attributes:dic2];
    NSString *str3 = [NSString stringWithFormat:@"(%f折)",1.5];
    NSDictionary *dic3 = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:16.0],
                           NSForegroundColorAttributeName : [UIColor colorWithRed:10/255.0 green:10/255.0 blue:10/255.0 alpha:1.0]
                           };
    NSAttributedString *attStr3 = [[NSAttributedString alloc]initWithString:str3 attributes:dic3];
    NSMutableAttributedString *muAttStr = [[NSMutableAttributedString alloc]init];
    [muAttStr insertAttributedString:attStr1 atIndex:0];
//    muAttStr insertAttributedString:attStr2 atIndex:<#(NSUInteger)#>
    return attStr3;
}








@end
