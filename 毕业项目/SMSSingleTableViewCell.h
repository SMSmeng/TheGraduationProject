//
//  SMSSingleTableViewCell.h
//  毕业项目
//
//  Created by 史猛 on 16/6/24.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SMSTableliftModel.h"

@interface SMSSingleTableViewCell : UITableViewCell

//@property (strong,nonatomic) NSDictionary *dic;
@property (strong,nonatomic)        UIImageView *imageName;
@property (strong,nonatomic)        UILabel *nameLabel;
@property (strong,nonatomic)        UILabel *titleLabel;
@property (strong,nonatomic)        UILabel *priceLabel;
@property (strong,nonatomic)        UIImageView *showpping;
@property (strong,nonatomic)        NSString *priceStr;
@property (strong,nonatomic)        NSString *priceString;
@end
