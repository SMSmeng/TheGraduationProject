//
//  SMSTableRightModel.h
//  毕业项目
//
//  Created by 史猛 on 16/6/25.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMSTableRightModel : NSObject
@property (copy, nonatomic) NSString *ActivityDate;

@property (copy, nonatomic) NSString *ActivityId;

@property (copy, nonatomic) NSString *LogoImg;

@property (copy, nonatomic) NSString *IfMiddlePage;

@property (copy, nonatomic) NSString *FormetDate;

@property (copy, nonatomic) NSString *ShopTitle;

@property (copy, nonatomic) NSString *Content;

@property (copy, nonatomic) NSString *CommodityText;

@property (copy, nonatomic) NSString *ImgView;

+(instancetype)modelWithDictionary:(NSDictionary *)dictionary;
@end
