//
//  BuildBarViewController.h
//  Bar
//
//  Created by 刘旭辉 on 15/2/12.
//  Copyright (c) 2015年 LXH. All rights reserved.
//  生成二维码

#import "BaseViewController.h"
#import "QRCodeGenerator.h"
#import "User.h"

@interface BuildBarViewController : BaseViewController<UITextFieldDelegate>

@property(nonatomic ,strong)UIImageView *imageview;

@property(nonatomic ,strong)User *user;

@property(nonatomic ,strong)NSString *jsonMsg;

@end
