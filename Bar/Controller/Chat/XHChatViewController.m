//
//  XHChatViewController.m
//  Bar
//
//  Created by 刘旭辉 on 15/3/4.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import "XHChatViewController.h"

@implementation XHChatViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
  //  self.edgesForExtendedLayout=UIRectEdgeAll;
}

- (id<RCLocationPickerViewControllerDataSource>)locationPickerDataSource {
    return [[XHLocationPickerBaiduMapDataSource alloc] init];
}

@end
