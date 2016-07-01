//
//  SMSImageModel.m
//  毕业项目
//
//  Created by 史猛 on 16/6/29.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SMSImageModel.h"

@implementation SMSImageModel
+ (instancetype)modelWith:(NSDictionary *)dictionary{
    SMSImageModel *model = [SMSImageModel new];
    [model setValuesForKeysWithDictionary:dictionary];
    return model;
}
@end
