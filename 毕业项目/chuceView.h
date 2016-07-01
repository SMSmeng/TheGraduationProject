//
//  chuceView.h
//  毕业项目
//
//  Created by 史猛 on 16/6/22.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^loginBlock)();//登录block
typedef void(^landingBlock )(NSDictionary *dic);//注册block

@interface chuceView : UIView
@property (copy,nonatomic)        loginBlock loginBlock;
@property (copy,nonatomic)      landingBlock landingBlock;

@end
