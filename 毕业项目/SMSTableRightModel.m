//
//  SMSTableRightModel.m
//  毕业项目
//
//  Created by 史猛 on 16/6/25.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SMSTableRightModel.h"

@implementation SMSTableRightModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary{
    SMSTableRightModel *model = [[SMSTableRightModel  alloc]init];
    [model setValuesForKeysWithDictionary:dictionary];
    return model;
}

@end
