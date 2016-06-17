//
//  SMSTabBarViewController.m
//  毕业项目
//
//  Created by 史猛 on 16/6/15.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SMSTabBarViewController.h"
#import "SMSNavigationViewController.h"
@interface SMSTabBarViewController ()
@property (strong,nonatomic)        NSArray *array;     /**用来存储赋值过的viewController*/
@end

@implementation SMSTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *viewControllerArray = [[NSMutableArray alloc]initWithCapacity:self.array.count];
    [self.array enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
        Class ViewController = NSClassFromString(dic[@"viewController"]);
        UIViewController *viewController = [[ViewController alloc]init];
        viewController.title = dic[@"title"];
        viewController.tabBarItem.image = [[UIImage imageNamed:dic[@"image"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.tabBarItem.selectedImage = [[UIImage imageNamed:dic[@"seleImage"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [viewController.tabBarItem setTitleTextAttributes:@{
                                                            NSFontAttributeName:[UIFont systemFontOfSize:16.0],
                                                            NSForegroundColorAttributeName:[UIColor colorWithRed:97/255.0 green:180/255.0 blue:242/255.0 alpha:1.0]
                                                            }forState:UIControlStateSelected];
        SMSNavigationViewController *navigationVC = [[SMSNavigationViewController alloc]initWithRootViewController:viewController];
        [viewControllerArray addObject:navigationVC];
    }];
    self.viewControllers = viewControllerArray;
    self.selectedIndex = 1;
    
}

- (NSArray *)array{
    if (!_array) {
        _array = [[NSArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TabBarViewController" ofType:@"plist"]];
    }
    return _array;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
