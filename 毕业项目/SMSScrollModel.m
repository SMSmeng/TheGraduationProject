//
//  SMSScrollModel.m
//  毕业项目
//
//  Created by 史猛 on 16/6/25.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SMSScrollModel.h"

@implementation SMSScrollModel
+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary{
    SMSScrollModel *model = [[SMSScrollModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dictionary];
    
    return model;
    
}
@end
