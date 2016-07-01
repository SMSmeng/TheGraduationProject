//
//  TimeSaleViewController.m
//  毕业项目
//
//  Created by 史猛 on 16/6/15.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "TimeSaleViewController.h"
#import "SMSBtn.h"
#import "Masonry.h"
#import "SMSTableView.h"
#import "UIViewController+CategoryFangFa.h"
#import "SMSScrollModel.h"
#import "SDCycleScrollView.h"
#import "SMSSingleTableViewCell.h"
#import "SMSGreoupTableViewCell.h"
#import "SMSDetailedViewController.h"
#import "SMSListViewController.h"


@interface TimeSaleViewController ()<UIScrollViewDelegate,SDCycleScrollViewDelegate>{
    
}
@property (strong,nonatomic)        UIScrollView *scrollView;//加载所有控件
@property (strong,nonatomic)        SDCycleScrollView *cycleScrollView2;//加载第一个滚动广告
@property (strong,nonatomic)        SMSBtn *smsButtonView;//转换双视图
@property (strong,nonatomic)        SMSTableView *smsTable;//加载第一个tableVIew
@property (strong,nonatomic)        SMSTableView *smStable;//加载第二个tableView
@property (strong,nonatomic)        SMSSingleTableViewCell *cellLift;//cell重写赋值
//@property (assign,nonatomic)        NSInteger *Height;
@property (strong,nonatomic)        NSArray *array;
@end

@implementation TimeSaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestToScroll];//获取scrollView的数据
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.cycleScrollView2];
    [self requestToTableRight];
    [self requestToTableLeft];
    [self.scrollView addSubview:self.smStable];
    [self.scrollView addSubview:self.smsTable];
    [self.scrollView addSubview:self.smsButtonView];
    
    [self requestToScroll];
    
    [self.smsButtonView.product addTarget:self action:@selector(productPushbrand) forControlEvents:UIControlEventTouchUpInside];
    [self.smsButtonView.brand addTarget:self action:@selector(brandPushproduct) forControlEvents:UIControlEventTouchUpInside];
    __weak typeof(self)     selfWeak = self;
    self.smsTable.pushXQBlock = ^(NSString *str){
        SMSDetailedViewController *xqVC = [[SMSDetailedViewController alloc]init];
        xqVC.GoodsId = str;
        [selfWeak.navigationController pushViewController:xqVC animated:YES];
    };
    self.smStable.pushFLBlock = ^(){
        SMSListViewController *flVC = [[SMSListViewController alloc]init];
        [selfWeak.navigationController pushViewController:flVC animated:YES];
    };
}
//转换tableView视图
- (void)productPushbrand{
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect tableFrame = self.smsTable.frame;
        tableFrame.size.width = CGRectGetWidth(self.view.frame);
        self.smsTable.frame = tableFrame;
        CGRect fram = self.smStable.frame;
        fram.origin.x = CGRectGetWidth(self.view.frame);
        self.smStable.frame = fram;
        self.scrollView.contentSize = CGSizeMake(0, self.smsTable.frame.size.height+282);
        
    }];
}
- (void)brandPushproduct{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect tableFrame = self.smsTable.frame;
        tableFrame.size.width = 0;
        self.smsTable.frame = tableFrame;
        CGRect fram = self.smStable.frame;
        fram.origin.x = 0;
        self.smStable.frame = fram;
        self.smStable.contentSize = CGSizeMake(0, self.smStable.frame.size.height+282);
    }];
}

//发送网络请求
- (void)requestToScroll{
    [self AFNGETofPOSTQingqiuFangShi:@"GET" URL:@"http://123.57.141.249:8080/beautalk/appHome/appHome.do" withDictionary:nil withSuccess:^(NSArray *success) {
        NSMutableArray *imageArr = [NSMutableArray array];
        NSMutableArray *titleArr = [NSMutableArray array];
        for (NSDictionary *dic in success) {
//            NSLog(@"请求成功");
            SMSScrollModel *model = [SMSScrollModel modelWithDictionary:dic];
            [imageArr addObject:model.ImgView];
            [titleArr addObject:model.CommodityText];
        }
        self.array = imageArr;
        self.cycleScrollView2.imageURLStringsGroup = self.array;
        
    } withFailedBlock:^(NSError *error) {
//        NSLog(@"错误原因%@",error.localizedDescription);
    } withProgressBlock:^(CGFloat index) {
    } with:@"text/plain"];
    
    
}
- (void)requestToTableLeft{
    NSString *string = @"http://123.57.141.249:8080/beautalk/appActivity/appHomeGoodsList.do";
    [self AFNGETofPOSTQingqiuFangShi:@"GET" URL:string withDictionary:nil withSuccess:^(NSArray *Arr) {

        self.smsTable.singleList = Arr;
        [UIView animateWithDuration:0 animations:^{
            CGRect rect = self.smsTable.frame;
            rect.size.height = Arr.count*170;
            self.smsTable.frame = rect;
        }];
        
        [self.smsTable reloadData];
    } withFailedBlock:^(NSError *error) {
//        NSLog(@"错误原因:%@",error.localizedDescription);
    } withProgressBlock:^(CGFloat value) {
    } with:@"text/html"];
}
- (void)requestToTableRight{
    NSString *stringURl = @"http://123.57.141.249:8080/beautalk/appActivity/appActivityList.do";
    [self AFNGETofPOSTQingqiuFangShi:@"GET" URL:stringURl withDictionary:nil withSuccess:^(NSArray *Arr) {

//            NSLog(@"拿到tableView222222数据");

        self.smStable.groutpList = Arr;
        [UIView animateWithDuration:0 animations:^{
            CGRect rect = self.smStable.frame;
            rect.size.height = Arr.count*150;
            self.smStable.frame = rect;
        }];
        [self.smStable reloadData];
        
    } withFailedBlock:^(NSError *error) {
//        NSLog(@"错误原因：%@",error.localizedDescription);
    } withProgressBlock:^(CGFloat value) {
        
    } with:@"text/html"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
        _scrollView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
        _scrollView.contentSize = CGSizeMake(0, 1000);
        _scrollView.delegate = self;
    }
    return _scrollView;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([scrollView isEqual:_scrollView]) {
        if (scrollView.contentOffset.y > 232) {
            CGRect twoBtn = self.smsButtonView.frame;
            twoBtn.origin.y = scrollView.contentOffset.y;
            self.smsButtonView.frame = twoBtn;
        }else{
            self.smsButtonView.frame = CGRectMake(0, 232, CGRectGetWidth(self.view.frame), 50);
        }
    }
    
}
- (SDCycleScrollView *)cycleScrollView2{
    if (!_cycleScrollView2) {
        _cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 232) delegate:self placeholderImage:[UIImage imageNamed:@"桌面"]];
        _cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _cycleScrollView2.currentPageDotColor = [UIColor whiteColor];
        
    }
    
    return _cycleScrollView2;
}
- (NSArray *)array{//存储第一个scrollView图片

    if (!_array) {
        _array = [[NSArray alloc]init];
    }
    return _array;
}
- (SMSBtn *)smsButtonView{
    if (!_smsButtonView) {
        _smsButtonView = [[SMSBtn alloc]init];
        _smsButtonView.frame = CGRectMake(0, 232, CGRectGetWidth(self.view.frame), 50);
    }
    return _smsButtonView;
}
- (SMSTableView *)smsTable{
    if (!_smsTable) {
        _smsTable = [[SMSTableView alloc]initWithFrame:CGRectMake(0, 282, CGRectGetWidth(self.view.frame), 700) style:UITableViewStylePlain];
        _smsTable.bounces = NO;
        _smsTable.isSingle = YES;
    }
    return _smsTable;
}
- (SMSTableView *)smStable{
    if (!_smStable) {
        _smStable = [[SMSTableView alloc]initWithFrame:CGRectMake(0, 282, CGRectGetWidth(self.view.frame), 700) style:UITableViewStylePlain];
        _smStable.bounces = NO;
        _smStable.isSingle = NO;
    
    }
    return _smStable;
}






@end
