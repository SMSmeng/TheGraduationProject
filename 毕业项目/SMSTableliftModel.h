//
//  SMSTableliftModel.h
//  毕业项目
//
//  Created by 史猛 on 16/6/25.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMSTableliftModel : NSObject

@property (copy, nonatomic) NSString *RestTime;

@property (copy, nonatomic) NSString *CountryImg;

@property (copy, nonatomic) NSString *DomesticPrice;

@property (copy, nonatomic) NSString *BuyCount;

@property (copy, nonatomic) NSString *ImgView;

@property (copy, nonatomic) NSString *FormetDate;

@property (copy, nonatomic) NSString *GoodsId;

@property (copy, nonatomic) NSString *ForeignPrice;

@property (copy, nonatomic) NSString *Stock;

@property (copy, nonatomic) NSString *Title;

@property (copy, nonatomic) NSString *Abbreviation;

@property (copy, nonatomic) NSString *Discount;

@property (copy, nonatomic) NSString *Price;

@property (copy, nonatomic) NSString *GoodsIntro;

@property (copy, nonatomic) NSString *OtherPrice;

@property (copy, nonatomic) NSString *CountryName;

@property (copy, nonatomic) NSString *Alert;



+(instancetype)modelWithDictionary:(NSDictionary *)dictionary;

@end
