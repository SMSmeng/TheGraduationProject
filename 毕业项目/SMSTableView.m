//
//  SMSTableView.m
//  毕业项目
//
//  Created by 史猛 on 16/6/24.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//




#import "SMSTableView.h"
#import "SMSSingleTableViewCell.h"
#import "SMSGreoupTableViewCell.h"
#import "SMSTableliftModel.h"
#import "SMSTableRightModel.h"
#import "UIImageView+WebCache.h"

@implementation SMSTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_isSingle) {
        return self.singleList.count;
    }else{
        return self.groutpList.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isSingle) {
        return 170.0;
    }else{
        return 150.0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"shimeng";
    if (_isSingle) {
        SMSSingleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[SMSSingleTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        }
        SMSTableliftModel *model = [SMSTableliftModel modelWithDictionary:self.singleList[indexPath.row]];
        
        [cell.imageName sd_setImageWithURL:[NSURL URLWithString:model.ImgView]];
        cell.nameLabel.text = model.Title;
        cell.titleLabel.text = model.GoodsIntro;
//        cell.priceStr = model.Price;
//        cell.priceString = model.OtherPrice;
        cell.priceLabel.text = model.Price;
        cell.showpping.image = [UIImage imageNamed:@"限时特卖界面购物车图标"];
        return cell;
    }else{
        SMSGreoupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[SMSGreoupTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        }
        SMSTableRightModel *model = [SMSTableRightModel modelWithDictionary:self.groutpList[indexPath.row]];
        [cell.imageV sd_setImageWithURL:[NSURL URLWithString:model.ImgView]];
        return cell;
        
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_isSingle) {
        if (_pushXQBlock) {
            SMSTableliftModel *model = [SMSTableliftModel new];
            self.pushXQBlock(model.GoodsId);
        }
    }else{
        if (_pushFLBlock) {
            self.pushFLBlock();
        }
    }
    
}



@end
