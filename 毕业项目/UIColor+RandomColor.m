//
//  UIColor+RandomColor.m
//  毕业项目
//
//  Created by 史猛 on 16/6/27.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)
+ (UIColor *)randomColor{
    CGFloat red = arc4random()%255;
    CGFloat green = arc4random()%255;
    CGFloat blue = arc4random()%255;
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:0.5];
}
@end
