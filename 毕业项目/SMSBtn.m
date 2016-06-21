//
//  SMSBtn.m
//  毕业项目
//
//  Created by 史猛 on 16/6/17.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SMSBtn.h"

@interface SMSBtn ()
@property (strong,nonatomic)        UIButton *product;/**新品按钮*/
@property (strong,nonatomic)        UIButton *brand;/**品牌按钮*/
//@property (strong,nonatomic)        UITableView *tableView;/**新品视图*/
//@property (strong,nonatomic)        UICollectionView *collection;/**品牌视图*/
@end
@implementation SMSBtn

- (instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.product];
        [self addSubview:self.brand];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.product.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    self.brand.frame = CGRectMake(CGRectGetWidth(self.frame)/2, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}
//#pragma mark - tableView 协议方法
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 8;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *xinpin = @"xnpinshitu";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xinpin];
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:xinpin];
//    }
//    cell.textLabel.text = @"asdfghjkl";
//    return cell;
//}
//- (UITableView *)tableView{
//    if (!_tableView) {
//        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, , 0, 0) style:UITableViewStylePlain];
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
//    }
//    return _tableView;
//}
- (UIButton *)product{
    if (!_product) {
        _product = [UIButton buttonWithType:UIButtonTypeCustom];
        _product.backgroundColor = [UIColor yellowColor];
    }
    return _product;
}
- (UIButton *)brand{
    if (!_brand) {
        _brand = [UIButton buttonWithType:UIButtonTypeCustom];
        _brand.backgroundColor = [UIColor redColor];
    }
    return _brand;
}


@end
