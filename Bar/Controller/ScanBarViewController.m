//
//  ScanBarViewController.m
//  Bar
//
//  Created by 刘旭辉 on 15/2/12.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import "ScanBarViewController.h"

@interface ScanBarViewController ()

@end

@implementation ScanBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupCamera];
}

-(void)initView{
    MyNavigationBar *navigation = [[MyNavigationBar alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, NavHeight) withTitle:@"扫描二维码" withLeftTitle:nil withRightTitle:nil withLeftBtnHidden:NO withRightBtnHidden:NO];
    self.navigatinBar = navigation;
    self.navigatinBar.delegate = self;
    [self.view addSubview:self.navigatinBar];
}


- (void)setupCamera
{
    ZBarReaderView *readerView = [[ZBarReaderView alloc]init];
    readerView.frame = CGRectMake(10, NavHeight+10, ScreenWidth-20,ScreenHeight - NavHeight*2);
    readerView.readerDelegate = self;
    //关闭闪光灯
    readerView.torchMode = 0;
  
    [self.view addSubview:readerView];

    [readerView start];
}


- (void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image
{
    for (ZBarSymbol *symbol in symbols) {
        NSLog(@"%@", symbol.data);
        ShowBarViewController *showVC = [[ShowBarViewController alloc]init];
        showVC.jsonMsg = symbol.data;
        [self presentViewController:showVC animated:NO completion:nil];
        break;
    }
    [readerView stop];
}


@end
