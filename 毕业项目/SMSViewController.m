//
//  SMSViewController.m
//  毕业项目
//
//  Created by 史猛 on 16/6/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SMSViewController.h"
#import "inputView.h"

@interface SMSViewController ()

@end

@implementation SMSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    inputView *inqut = [[inputView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:inqut];
    
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
