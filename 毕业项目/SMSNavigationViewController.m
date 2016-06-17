//
//  SMSNavigationViewController.m
//  毕业项目
//
//  Created by 史猛 on 16/6/15.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SMSNavigationViewController.h"

@interface SMSNavigationViewController ()

@end

@implementation SMSNavigationViewController

+ (void)initialize{
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:UIBarMetricsDefault];
    [navBar setTitleTextAttributes:@{
                                     NSFontAttributeName : [UIFont boldSystemFontOfSize:20.0]
                                    
                                     }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
