//
//  DoubleCollectionViewCell.m
//  毕业项目
//
//  Created by 史猛 on 16/6/27.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "DoubleCollectionViewCell.h"

@implementation DoubleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.imageV];
    }
    return self;
}
- (UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    }
    return _imageV;
}

@end
