//
//  RegisteredViewController.m
//  毕业项目
//
//  Created by 史猛 on 16/6/21.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "RegisteredViewController.h"
#import "chuceView.h"
#import "thirdView.h"
#import "VerifiViewController.h"
#import "AFNetworking.h"
@interface RegisteredViewController ()
@property (strong,nonatomic)        chuceView *chuce;
@property (strong,nonatomic)        thirdView *third;
@end

@implementation RegisteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.chuce];
    [self.view addSubview:self.third];
    self.view.backgroundColor = [UIColor whiteColor];
    
}
- (void)pushYanzhengShoujihao:(NSDictionary *)dic{
    VerifiViewController *verVC = [[VerifiViewController alloc]init];
    verVC.dic = dic;
    [self.navigationController pushViewController:verVC animated:YES];
    
}
- (void)popView{
    [self.navigationController popViewControllerAnimated:YES];
}
- (chuceView *)chuce{
    if (!_chuce) {
        _chuce = [[chuceView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 250)];
        __weak typeof(self)     selfWeak = self;
        _chuce.landingBlock  = ^(NSDictionary *dic){
            [selfWeak pushYanzhengShoujihao:dic];
        };
        _chuce.loginBlock = ^(){
            [selfWeak popView];
        };
    }
    return _chuce;
}


- (thirdView *)third{
    if (!_third) {
        _third = [[thirdView alloc]initWithFrame:CGRectMake(0,250, CGRectGetWidth(self.view.frame), 100)];
        
    }
    return _third;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
