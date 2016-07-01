//
//  SMSImageModel.h
//  毕业项目
//
//  Created by 史猛 on 16/6/29.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMSImageModel : NSObject
@property (copy,nonatomic)      NSString *ImgView;//1.轮播位图片
@property (copy,nonatomic)      NSString *ImgType;//;2.详情图片
@property (copy,nonatomic)      NSString *ResoluZon;//3.实拍图片高度
+ (instancetype)modelWith:(NSDictionary *)dictionary;

@end
