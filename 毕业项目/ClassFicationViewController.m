//
//  ClassFicationViewController.m
//  毕业项目
//
//  Created by 史猛 on 16/6/15.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "ClassFicationViewController.h"
#import "SMSCollectionView.h"
#import "UIViewController+CategoryFangFa.h"
#import "UIColor+RandomColor.h"

@interface ClassFicationViewController ()<UISearchBarDelegate>
@property (strong,nonatomic)        SMSCollectionView *SMSCollection;
@end

@implementation ClassFicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加搜索栏
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 35)];
    UIColor *color = self.navigationController.navigationBar.barTintColor;
    [titleView setBackgroundColor:color];
    UISearchBar *searchBar = [[UISearchBar alloc]init];
    searchBar.delegate = self;
    searchBar.frame = CGRectMake(0, 0, 300, 35);
    searchBar.backgroundColor = color;
    searchBar.layer.cornerRadius = 10;
    searchBar.layer.masksToBounds = YES;
    [searchBar.layer setBorderWidth:8];
    [searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];
    searchBar.placeholder = @"商品名 ／ 功效 ／ 品牌";
    [titleView addSubview:searchBar];
    [self.navigationItem.titleView sizeToFit];
    self.navigationItem.titleView = titleView;
    
    //获取服务器数据
    [self requestCollection];
    
//    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
//    scrollView.contentSize = CGSizeMake(0, CGRectGetHeight(self.view.frame)+100);
//    [self.view addSubview:scrollView];
//    [scrollView addSubview:self.SMSCollection];
    
    [self requestCollectionDouble];
    [self requestCollectionSan];
    [self.view addSubview:self.SMSCollection];

    
}

- (void)requestCollection{
    NSString *urlStr = @"http://123.57.141.249:8080/beautalk/appBrandareatype/findBrandareatype.do";
    [self AFNGETofPOSTQingqiuFangShi:@"GET" URL:urlStr withDictionary:nil withSuccess:^(NSArray *Arr) {
        self.SMSCollection.array = Arr;
        [self.SMSCollection reloadData];
    } withFailedBlock:^(NSError *error) {
//        NSLog(@"错误原因？？");
    } withProgressBlock:^(CGFloat value) {
    } with:@""];
}
- (void)requestCollectionDouble{
    NSString *urlStr = @"http://123.57.141.249:8080/beautalk/appBrandarea/asianBrand.do";
    [self AFNGETofPOSTQingqiuFangShi:@"GET" URL:urlStr withDictionary:nil withSuccess:^(NSArray *Arr) {
        NSLog(@"数据成功获取");
        self.SMSCollection.doubleArray = Arr;
    } withFailedBlock:^(NSError *error) {
        
    } withProgressBlock:^(CGFloat value) {
    } with:@""];
}
- (void)requestCollectionSan{
    NSString *urlStr = @"http://123.57.141.249:8080/beautalk/appBrandareanew/findBrandareanew.do";
    [self AFNGETofPOSTQingqiuFangShi:@"GET" URL:urlStr withDictionary:nil withSuccess:^(NSArray *Arr) {
        self.SMSCollection.topTitle = Arr;
        NSLog(@"拿到第三个数据");
    } withFailedBlock:^(NSError *error) {
        NSLog(@"拿bu不不不不不到第三个数据");

    } withProgressBlock:^(CGFloat value) {
    } with:@""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (SMSCollectionView *)SMSCollection{
    if (!_SMSCollection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 1.0;
        layout.minimumInteritemSpacing = 1.0;
        
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake((self.view.frame.size.width-3)/4, 100);
        _SMSCollection = [[SMSCollectionView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) collectionViewLayout:layout];
        layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 40);
        
    }
    return _SMSCollection;
}











@end
