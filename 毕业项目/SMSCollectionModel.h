//
//  SMSCollectionModel.h
//  毕业项目
//
//  Created by 史猛 on 16/6/27.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMSCollectionModel : NSObject
/**类型*/
@property (copy, nonatomic) NSString *GoodsType;
/**图片*/
@property (copy, nonatomic) NSString *ImgView;
/**名字*/
@property (copy, nonatomic) NSString *GoodsTypeName;

@property (copy, nonatomic) NSString *ShopId;

@property (copy, nonatomic) NSString *CommodityText;

+ (instancetype)modelDictionary:(NSDictionary *)dictionary;
@end
