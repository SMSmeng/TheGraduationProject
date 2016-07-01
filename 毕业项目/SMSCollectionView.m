//
//  SMSCollectionView.m
//  毕业项目
//
//  Created by 史猛 on 16/6/27.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "SMSCollectionView.h"
#import "CollectionViewCell.h"
#import "DoubleCollectionViewCell.h"
#import "SMSCollectionModel.h"
#import "DoubleCollectionModel.h"
#import "SMSCollectionModel.h"
#import "UIImageView+WebCache.h"
#import "SSCcollectionCell.h"

@implementation SMSCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"123"];
         [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"456"];
         [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"789"];

        [self registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
        [self registerClass:[DoubleCollectionViewCell class] forCellWithReuseIdentifier:@"DoubleCollectionViewCell"];
        [self registerClass:[SSCcollectionCell class] forCellWithReuseIdentifier:@"SSCcollectionCell"];
               self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return self.array.count;
    }else if (section == 1){
        return self.doubleArray.count;
    }else if (section == 2){
        return self.topTitle.count;
    }else{
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
        CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
        SMSCollectionModel *model = [SMSCollectionModel modelDictionary:self.array[indexPath.row]];
        
        [cell.imageV sd_setImageWithURL:[NSURL URLWithString:model.ImgView]];
        cell.labelTitle.text = model.GoodsTypeName;
        return cell;
        
    }else if (indexPath.section == 1){
        DoubleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DoubleCollectionViewCell" forIndexPath:indexPath];
        NSDictionary *dic = self.doubleArray[indexPath.row];
        
        [cell.imageV sd_setImageWithURL:[NSURL URLWithString:dic[@"ImgView"]]];
        return cell;
        
    }else if (indexPath.section == 2){
        SSCcollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SSCcollectionCell" forIndexPath:indexPath];
        NSDictionary *dic = self.topTitle[indexPath.row];
        [cell.imageV sd_setImageWithURL:[NSURL URLWithString:dic[@"ImgView"]]];
        return cell;
    }else{
        return nil;
    }
}
//添加组头
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UICollectionReusableView *reusable = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"123" forIndexPath:indexPath];
        UILabel *label = [[UILabel alloc]initWithFrame:reusable.bounds];
        label.text = @"  功效专区";
        [reusable addSubview:label];
        reusable.backgroundColor = [UIColor colorWithRed:230/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
        return reusable;
    }else if (indexPath.section == 1){
        UICollectionReusableView *resable = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"456" forIndexPath:indexPath];
        UILabel *label = [[UILabel alloc]initWithFrame:resable.bounds];
        label.text = @"  知名品牌";
        [resable addSubview:label];
        resable.backgroundColor = [UIColor colorWithRed:239/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
        return resable;
    }else if (indexPath.section == 2){
        UICollectionReusableView *resable = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"789" forIndexPath:indexPath];
        UILabel *label = [[UILabel alloc]initWithFrame:resable.bounds];
        label.text = @"  新品专区";
        [resable addSubview:label];

        resable.backgroundColor = [UIColor colorWithRed:239/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
        return resable;
    }else{
        return nil;
    }
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"------------%li",indexPath.row);
}














@end
