//
//  UIViewController+CategoryFangFa.m
//  毕业项目
//
//  Created by 史猛 on 16/6/25.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "UIViewController+CategoryFangFa.h"
#import "AFNetworking.h"
#import <SVProgressHUD.h>


@implementation UIViewController (CategoryFangFa)

- (void)AFNGETofPOSTQingqiuFangShi:(NSString *)GETPOST URL:(NSString *)URLString withDictionary:(NSDictionary *)dictionary withSuccess:(SuccessBlock)successBlock withFailedBlock:(FailedBlock)failedBlock withProgressBlock:(ProgressBlock)progressBlock with:(NSString *)string{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/html", nil];
    if ([GETPOST isEqualToString:@"GET"]) {
        [SVProgressHUD show];
        [manager GET:URLString parameters:dictionary progress:^(NSProgress * _Nonnull downloadProgress) {
            CGFloat value = downloadProgress.completedUnitCount/(downloadProgress.totalUnitCount*1.0);
            progressBlock(value);
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [SVProgressHUD dismiss];
            successBlock(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [SVProgressHUD dismiss];
            failedBlock(error);
        }];
        
    }else{
        [SVProgressHUD show];
        [manager POST:URLString parameters:dictionary progress:^(NSProgress * _Nonnull uploadProgress) {
            CGFloat value = uploadProgress.completedUnitCount/(uploadProgress.totalUnitCount*1.0);
            progressBlock(value);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [SVProgressHUD dismiss];
            successBlock(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [SVProgressHUD dismiss];
            failedBlock(error);
        }];
        
    }
    
    
    
}

@end
