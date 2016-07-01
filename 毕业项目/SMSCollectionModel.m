//
//  SMSCollectionModel.m
//  毕业项目
//
//  Created by 史猛 on 16/6/27.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SMSCollectionModel.h"

@implementation SMSCollectionModel
+ (instancetype)modelDictionary:(NSDictionary *)dictionary{
    SMSCollectionModel *model = [SMSCollectionModel new];
    [model setValuesForKeysWithDictionary:dictionary];
//    model.ImgView = dictionary[@"ImgView"];
//    model.GoodsType = dictionary[@"GoodsType"];
    return model;
}
@end
