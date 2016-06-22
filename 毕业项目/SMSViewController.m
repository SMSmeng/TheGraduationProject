//
//  SMSViewController.m
//  毕业项目
//
//  Created by 史猛 on 16/6/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SMSViewController.h"
#import "inputView.h"
#import "thirdView.h"
#import "UMSocial.h"        /**设置一健登陆的第三方*/
#import "RegisteredViewController.h"
#import "MyViewController.h"


@interface SMSViewController ()
@property (strong,nonatomic)        inputView *input;
@property (strong,nonatomic)        thirdView *third;
@property (strong,nonatomic)        MyViewController *myVC;
@end

@implementation SMSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

  [self.input.dengLuBtn addTarget:self action:@selector(fasongWangluoQingqiu) forControlEvents:UIControlEventTouchUpInside];
    [self.input.chuCeBtn addTarget:self action:@selector(pushRegisteredView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.input];
    [self.third.qqBtn addTarget:self action:@selector(showQQ) forControlEvents:UIControlEventTouchUpInside];
    [self.third.wxBtn addTarget:self action:@selector(showWX) forControlEvents:UIControlEventTouchUpInside];
    [self.third.wbBtn addTarget:self action:@selector(showWB) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.third];
    
    
}

- (inputView *)input{
    if (!_input) {
        _input = [[inputView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 250)];
    }
    return _input;
}
- (thirdView *)third{
    if (!_third) {
        _third = [[thirdView alloc]initWithFrame:CGRectMake(0, self.input.frame.size.height, CGRectGetWidth(self.view.frame), 100)];
    }
    return _third;
}

#pragma mark - 按钮响应事件
- (void)fasongWangluoQingqiu{  //17721025595   123123
    
    NSString *urlStr = [NSString stringWithFormat:@"http://123.57.141.249:8080/beautalk/appMember/appLogin.do?LoginName=%@&Lpassword=%@",self.input.nameField_1.text,self.input.passField_2.text];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"失败原因：%@",error.localizedDescription);
            
        }else{
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            [[NSUserDefaults standardUserDefaults] setValue:dic forKey:@"ISLOGIN"];
        }
    }];
    [task resume];
    [self.myVC.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)pushRegisteredView{
    RegisteredViewController *regiVC = [[RegisteredViewController alloc]init];
    [self.navigationController pushViewController:regiVC animated:YES];
    
}

- (void)showQQ{
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取腾讯QQ用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
//            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }});
    
}
- (void)showWX{
    
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //获取微信用户名 等。。
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
//            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }
        
    });
    
}
- (void)showWB{
    
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
//            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }});
    
}
- (MyViewController *)myVC{
    if (!_myVC) {
        _myVC = [MyViewController new];
    }
    return _myVC;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
