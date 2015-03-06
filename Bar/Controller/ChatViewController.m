//
//  ChatViewController.m
//  Bar
//
//  Created by 刘旭辉 on 15/3/3.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)initView{
    
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setFrame:CGRectMake(50, 100, 80, 40)];
    [self.button setTitle:@"会话列表" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setFrame:CGRectMake(150, 100, 80, 40)];
    [self.button setTitle:@"单聊" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonClicked1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
   // [self requsetToken];
    
    [self loginRCIM];
}

-(void)requsetToken{
    NSString * urlStr= @"/user/getToken.json";
    
    NSDictionary *parameters=@{@"userId":@"1",@"name":@"lxh",@"portraitUri":@"",@"App-Key": RCIMKEY};
    
    NetHandler *handler = [[NetHandler alloc]init];
    
    handler.client.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
   
    SuccessBlock success = ^(id obj){
        
        [AppUtiles dismissHUD];
        
       DebugLog(@"--------success%@",obj);
    };
    
    FailedBlock failed = ^(id obj){
        
        DebugLog(@"--------err%@",obj);
        
        [AppUtiles showNetErrorMessage];
    };
    [handler requestData:parameters requestUrl:urlStr success:success failed:failed];
}

/**
 *  @author 刘旭辉, 15-03-03 14:03:00
 *
 *  登录
 */
-(void)loginRCIM{
    // 连接融云服务器。
    [SVProgressHUD setBackgroundColor:[UIColor lightGrayColor] ];
    
    [RCIM connectWithToken:@"Q8h78l4F/s4FOQ8Dtr2b5Hj3WKLPAnzgr5rtagrKK0y4Nbhm4SjQo7C95jH0tLoiVpkwflhM+UXqW1f/0L6nFA==" completion:^(NSString *userId) {
        // 此处处理连接成功。
        [AppUtiles showSuccessMessage:@"登录成功"];
    } error:^(RCConnectErrorCode status) {
        // 此处处理连接错误。
        [AppUtiles showErrorMessage:@"登录失败"];
    }];
}

/**
 *  @author 刘旭辉, 15-03-03 14:03:27
 *
 *  启动单聊界面
 */
// 按钮点击事件。
-(void)buttonClicked:(id)sender
{
    XHChatListViewController * temp =  [[XHChatListViewController alloc]init];
    temp.hidesBottomBarWhenPushed = YES;
//    temp.portraitStyle = RCUserAvatarCycle;
    
    [self.navigationController pushViewController:temp animated:YES];
}


-(void)buttonClicked1:(id)sender
{
    XHChatViewController * temp =  [[XHChatViewController alloc]init];
    
    temp.currentTarget = @"1";
    temp.currentTargetName = @"ddd";
    temp.conversationType = ConversationType_PRIVATE;
    temp.hidesBottomBarWhenPushed = YES;
    //    temp.portraitStyle = RCUserAvatarCycle;
    
    [self.navigationController pushViewController:temp animated:YES];
    
    
//    // 创建单聊视图控制器。
//    RCChatViewController *chatViewController = [[RCIM sharedRCIM]createPrivateChat:@"1" title:@"自问自答" completion:^(){
//        // 创建 ViewController 后，调用的 Block，可以用来实现自定义行为。
//    }];
//    
//    // 把单聊视图控制器添加到导航栈。
//    [self.navigationController pushViewController:chatViewController animated:YES];
}


@end
