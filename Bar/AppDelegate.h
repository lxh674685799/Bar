//
//  AppDelegate.h
//  Bar
//
//  Created by 刘旭辉 on 15/2/12.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import <UIKit/UIKit.h>

// 引用 IMKit 头文件。
#import "RCIM.h"
// 引用 百度地图 头文件。
#import "BMapKit.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate,BMKGeneralDelegate,RCIMFriendsFetcherDelegate, RCIMUserInfoFetcherDelegagte, RCIMGroupInfoFetcherDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) BMKMapManager *mapManager;

@end

