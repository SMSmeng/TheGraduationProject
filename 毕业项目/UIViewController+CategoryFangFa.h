//
//  UIViewController+CategoryFangFa.h
//  毕业项目
//
//  Created by 史猛 on 16/6/25.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^SuccessBlock)(id);
typedef void(^FailedBlock)(NSError *);
typedef void(^ProgressBlock)(CGFloat);

@interface UIViewController (CategoryFangFa)

- (void)AFNGETofPOSTQingqiuFangShi:(NSString *)GETPOST URL:(NSString *)URLString withDictionary:(NSDictionary *)dictionary withSuccess:(SuccessBlock)successBlock withFailedBlock:(FailedBlock)failedBlock withProgressBlock:(ProgressBlock)progressBlock with:(NSString *)string;

@end
