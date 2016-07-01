//
//  SMSDetailedViewController.m
//  毕业项目
//
//  Created by 史猛 on 16/6/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SMSDetailedViewController.h"
#import "SDCycleScrollView.h"
#import "UIViewController+CategoryFangFa.h"
#import "SMSImageModel.h"

@interface SMSDetailedViewController ()<SDCycleScrollViewDelegate>
@property (strong,nonatomic)        UIScrollView *scrollMain;
@property (strong,nonatomic)        SDCycleScrollView *scrollV;

@end

@implementation SMSDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollMain];
    // Do any additional setup after loading the view.
}
//网络请求        6217 0024  3001  8045 717      622848  0078125000675
- (void)requestScrollWithImageView{
    NSString *urlStr = @"http://123.57.141.249:8080/beautalk/appGoods/findGoodsImgList.do";
    [self AFNGETofPOSTQingqiuFangShi:@"GET" URL:urlStr withDictionary:_GoodsId withSuccess:^(NSArray *Arr) {
//        NSArray *imageArr = [NSArray array];
        NSLog(@"拿到数据");
//        for (NSDictionary * dic in Arr) {
////            SMSImageModel *model = [SMSImageModel modelWith:dic];
//            self.scrollV.imageURLStringsGroup = dic[@"ImgView"];
////            imageArr = model.ImgView;
//        }
//        NSDictionary *dic = []
        
//        self.scrollV.imageURLStringsGroup = Arr;
    } withFailedBlock:^(NSError *error) {
        NSLog(@"错误原因%@",error.localizedDescription);
    } withProgressBlock:^(CGFloat value) {
        
    } with:@""];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIScrollView *)scrollMain{
    if (!_scrollMain) {
        _scrollMain = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
        [_scrollMain addSubview:self.scrollV];
    }
    return _scrollMain;
}
- (SDCycleScrollView *)scrollV{
    if (!_scrollV) {
        _scrollV = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 300) delegate:self placeholderImage:[UIImage imageNamed:@"桌面"]];
        _scrollV.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _scrollV.currentPageDotColor = [UIColor whiteColor];
    }
    return _scrollV;
}







@end
