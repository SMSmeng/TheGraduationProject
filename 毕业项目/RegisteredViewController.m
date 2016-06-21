//
//  RegisteredViewController.m
//  毕业项目
//
//  Created by 史猛 on 16/6/21.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "RegisteredViewController.h"

@interface RegisteredViewController ()
@property (strong,nonatomic)        UILabel *topLabel;
@property (strong,nonatomic)        UILabel *backLabel;
@property (strong,nonatomic)        UITextField *nameTextField;
@property (strong,nonatomic)        UILabel *lineLabel;
@property (strong,nonatomic)        UITextField *passTextField;
@property (strong,nonatomic)        UIButton *toBtn;
@property (strong,nonatomic)        UIButton *dengLuBtn;
@end

@implementation RegisteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (UILabel *)topLabel{
    if (!_topLabel) {
        _topLabel = [[UILabel alloc]init];
//        _topLabel.backgroundColor = [UIColor colorWithRed:24 green:<#(CGFloat)#> blue:<#(CGFloat)#> alpha:<#(CGFloat)#>]
    }
    return _topLabel;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
