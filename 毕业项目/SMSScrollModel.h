//
//  SMSScrollModel.h
//  毕业项目
//
//  Created by 史猛 on 16/6/25.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMSScrollModel : NSObject
@property (copy, nonatomic) NSString *ImgView;

@property (copy, nonatomic) NSString *CommodityText;

@property (copy, nonatomic) NSString *IfMiddlePage;

@property (copy, nonatomic) NSString *RelatedId;

+(instancetype)modelWithDictionary:(NSDictionary *)dictionary;
@end
