//
//  SMSScrolView.m
//  毕业项目
//
//  Created by 史猛 on 16/6/17.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SMSScrolView.h"

@interface SMSScrolView ()
@property (strong,nonatomic)        UIImageView *imageView;
@end
@implementation SMSScrolView

- (instancetype)init{
    if (self = [super init]) {
        UIImage *image = [UIImage imageNamed:@"详情界面立即购买按钮"];
        self.imageView.image = image;
        [self addSubview:self.imageView];
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}

@end
