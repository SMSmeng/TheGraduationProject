//
//  VerifiViewController.m
//  毕业项目
//
//  Created by 史猛 on 16/6/22.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "VerifiViewController.h"
#import "verifiView.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"


@interface VerifiViewController ()
@property (strong,nonatomic)        verifiView *verView;
@end

@implementation VerifiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.verView];
    // Do any additional setup after loading the view.
}
- (verifiView *)verView{
    if (!_verView) {
        _verView = [[verifiView alloc]initWithFrame:self.view.bounds];
        [_verView.zhuceBtn addTarget:self action:@selector(zhuceButton) forControlEvents:UIControlEventTouchUpInside];
        [_verView.chongXinFasong addTarget:self action:@selector(fasongYanzhenMa) forControlEvents:UIControlEventTouchUpInside];
    }
    return _verView;
}
//注册用户
- (void)zhuceButton{
    NSDictionary *dict = @{
                           @"LoginName":_dic[@"LoginName"],
                           @"Lpassword":_dic[@"Lpassword"],
                           @"Code":_verView.CAPTCHA.text,
                           @"Telephone":_dic[@"LoginName"]
                           };
    [SVProgressHUD show];
    AFHTTPSessionManager *managr = [AFHTTPSessionManager manager];
//    managr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [managr GET:@"http://123.57.141.249:8080/beautalk/appMember/appRegistraZon.do" parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if ([dict[@"result"] isEqual:@"success"]) {
            NSLog(@"注册成功");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        NSLog(@"错误原因:%@", error.localizedDescription);
       
    }];
    
}
//重新发送验证码
- (void)fasongYanzhenMa{
    
    [SVProgressHUD show];
    [[AFHTTPSessionManager manager] POST:@"http://123.57.141.249:8080/beautalk/appMember/createCode.do" parameters:@{@"MemberId":_dic[@"LoginName"]} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([_dic[@"result"] isEqual:@"success"]) {
            NSLog(@"注册成功");
            [self daoJiShi];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
//倒计时短信｛
- (void)daoJiShi{
    __block NSInteger timeout = 60;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        if (timeout <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.verView.chongXinFasong.userInteractionEnabled = YES;
                self.verView.daojishiLabel.text = @"验证码";
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                self.verView.chongXinFasong.userInteractionEnabled = NO;
                self.verView.daojishiLabel.text = [NSString stringWithFormat:@"%li秒后重试",timeout];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
