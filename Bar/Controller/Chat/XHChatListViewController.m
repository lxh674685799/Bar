//
//  XHChatListViewController.m
//  Bar
//
//  Created by 刘旭辉 on 15/3/4.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import "XHChatListViewController.h"

@implementation XHChatListViewController


-(void)viewDidLoad
{
    [super viewDidLoad];

    self.edgesForExtendedLayout=UIRectEdgeAll;
  //  [self.navigationController.navigationBar setTranslucent:NO];
   
   //自定义导航标题颜色
    [self.navigationController.navigationBar setBackgroundImage:[AppUtiles createImageWithColor:RGBCOLOR(43, 132, 210)] forBarMetrics:UIBarMetricsDefault];
  
  //  [self setNavigationTitle:@"会话" textColor:[UIColor blackColor]];
    
//
//    //自定义导航左右按钮
//    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(leftBarButtonItemPressed:)];
//    [leftButton setTintColor:[UIColor blackColor]];
//    self.navigationItem.leftBarButtonItem = leftButton;
//    //自定义导航左右按钮
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"选择" style:UIBarButtonItemStyleBordered target:self action:@selector(rightBarButtonItemPressed:)];
//    [rightButton setTintColor:[UIColor blackColor]];
//    self.navigationItem.rightBarButtonItem = rightButton;
  
  
}




@end
