//
//  inputView.h
//  毕业项目
//
//  Created by 史猛 on 16/6/16.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol inPutViewDeleGate <NSObject>

-(void)PushViewContronllerWithDictionary:(NSDictionary *)dictionary;

@end

@interface inputView : UIView
@property (strong,nonatomic)        UILabel *backLabel;
@property (strong,nonatomic)        UILabel *lineLabel;
@property (strong,nonatomic)        UITextField *nameField_1;
@property (strong,nonatomic)        UITextField *passField_2;
@property (strong,nonatomic)        UIButton *dengLuBtn;
@property (strong,nonatomic)        UIButton *chuCeBtn;

@property(assign,nonatomic) id <inPutViewDeleGate> deleGate;


@end
