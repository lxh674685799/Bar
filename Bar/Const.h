//
//  Const.h
//  kuaixiao
//
//  Created by lxh on 14/11/19.
//  Copyright (c) 2014年 lxh. All rights reserved.
//

#ifndef UU898Game_Const_h
#define UU898Game_Const_h

//APP INFO
#define APP_NAME @"Bar"
#define VERSION @"v0.1.0"
#define COPYRIGHT @"Copyright @2014 LXH All Rights Reserved"

/// NSError userInfo key that will contain response data
#define JSONResponseSerializerWithDataKey @"JSONResponseSerializerWithDataKey"

//屏幕高度和宽度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
//是否是ios7系统
#define IOS7  [[[UIDevice currentDevice]systemVersion] intValue]<7?NO:YES
#define IOS8  [[[UIDevice currentDevice]systemVersion] intValue]<8?NO:YES
//自定义navigationbar的高度值
#define NavHeight  ([[[UIDevice currentDevice]systemVersion] intValue]<7?44.0:64.0)
////屏幕开始的Y值
//#define ScreenY  [[[UIDevice currentDevice]systemVersion] intValue]<7?44:64
//除去navigationbar和tabbar之外的屏幕高度,ios6减去头44和20的状态栏
#define MiddleHeight [[[UIDevice currentDevice]systemVersion] intValue]<7?([UIScreen mainScreen].bounds.size.height - 64.0):([UIScreen mainScreen].bounds.size.height-44.0)
//rgbColor
#define Color(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define BACKGROUNDCOLOR [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0]
#define TITLELABELCOLOR [UIColor colorWithRed:11.0/255.0 green:92.0/255.0 blue:254.0/255.0 alpha:1.0]
#pragma mark - 本地文件存储路径 -
#define DOCUMENT_CACHE [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]


#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

//计算旋转角度
#define degreeTOradians(x) (M_PI * (x)/180);

#pragma mark - 服务器地址 -
#define SERVER_HOST @"api.cn.rong.io"

#pragma mark - 百度地图秘钥-
#define BAIDUMAPKEY @"O5qGyY00UOIOMq2eGqAs9z2W"
#pragma mark - 融云秘钥-
#define RCIMKEY @"k51hidwq1fjnb"
#pragma mark - 融云用户请求-
#define USER_URL @"https://api.cn.rong.io/user/checkOnline.json"

#endif
