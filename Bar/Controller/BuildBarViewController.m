//
//  BuildBarViewController.m
//  Bar
//
//  Created by 刘旭辉 on 15/2/12.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import "BuildBarViewController.h"

@interface BuildBarViewController ()

@end

@implementation BuildBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated{
    _user = [User alloc];
    [AppUtiles removeAllSubView:self.view];
    [self initView];
}


-(void)initView{
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(5, NavHeight, 80, 40)];
    lable.text = @"姓名:";
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(5, NavHeight+40, 80, 40)];
    lable1.text = @"电话:";
    [self.view addSubview:lable];
    [self.view addSubview:lable1];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, NavHeight+40, ScreenWidth, 0.5)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    UIView *lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, NavHeight+40*2, ScreenWidth, 0.5)];
    lineView1.backgroundColor = [UIColor lightGrayColor];
  
    [self.view addSubview:lineView];
    [self.view addSubview:lineView1];
    
    UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(90, NavHeight+5, ScreenWidth-95, 30)];
    field.placeholder=@"请输入姓名";
    field.tag = 1000;
    field.delegate = self;
    field.borderStyle = UITextBorderStyleRoundedRect;
    UITextField *field1 = [[UITextField alloc]initWithFrame:CGRectMake(90, NavHeight+40+5, ScreenWidth-95, 30)];
    field1.placeholder=@"请输入电话";
    field1.tag = 2000;
    field1.delegate = self;
    field1.borderStyle = UITextBorderStyleRoundedRect;
   
    [self.view addSubview:field];
    [self.view addSubview:field1];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((ScreenWidth - 200)/2, NavHeight+80+5,200, 30)];
    btn.titleLabel.textColor = [UIColor blackColor];
    [btn setTitle:@"生成二维码" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(buildBar) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}


-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 1000) {
        _user.name = textField.text;
    }else if(textField.tag == 2000){
        _user.phone = textField.text;
    }
}

-(void)buildBar{
    [_imageview removeFromSuperview];
    NSDictionary *jsonStrDic = [_user keyValues];
    _jsonMsg= [AppUtiles stringFromDic:jsonStrDic];

    _imageview = [[UIImageView alloc]initWithFrame:CGRectMake((ScreenWidth - 200)/2, NavHeight+200+5,200, 200)];
    UIImage *barImage = [QRCodeGenerator qrImageForString:_jsonMsg imageSize:_imageview.bounds.size.width];
    [_imageview setImage:barImage];
    [self.view addSubview:_imageview];
}

@end
