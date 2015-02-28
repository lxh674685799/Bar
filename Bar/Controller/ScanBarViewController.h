//
//  ScanBarViewController.h
//  Bar
//
//  Created by 刘旭辉 on 15/2/12.
//  Copyright (c) 2015年 LXH. All rights reserved.
//  扫描二维码

#import "BaseViewController.h"
#import "ZBarSDK.h"
#import "ShowBarViewController.h"

@interface ScanBarViewController : BaseViewController<ZBarReaderViewDelegate>
@end
