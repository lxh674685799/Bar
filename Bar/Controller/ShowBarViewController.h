//
//  ShowBarViewController.h
//  Bar
//
//  Created by 刘旭辉 on 15/2/12.
//  Copyright (c) 2015年 LXH. All rights reserved.
//  展示信息页面

#import <AddressBook/AddressBook.h>
#import "BaseViewController.h"
#import "User.h"

@interface ShowBarViewController : BaseViewController

@property(nonatomic ,strong)User *user;

@property(nonatomic ,strong)NSString *jsonMsg;

@end
