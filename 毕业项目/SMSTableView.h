//
//  SMSTableView.h
//  毕业项目
//
//  Created by 史猛 on 16/6/24.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^pushXQBlock)(NSString *);
typedef void(^pushFLBlock)();
@interface SMSTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)        NSArray *singleList; //新品
@property (strong,nonatomic)        NSArray *groutpList;//品牌

@property (assign,nonatomic)        BOOL isSingle;  //yes是新品
@property (copy,nonatomic)      pushXQBlock pushXQBlock;
@property (copy,nonatomic)      pushFLBlock pushFLBlock;

@end
