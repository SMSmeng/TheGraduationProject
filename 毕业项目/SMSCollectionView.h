//
//  SMSCollectionView.h
//  毕业项目
//
//  Created by 史猛 on 16/6/27.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMSCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong,nonatomic)        NSArray *array;
@property (strong,nonatomic)        NSArray *doubleArray;
@property (strong,nonatomic)        NSArray *topTitle;
@end
