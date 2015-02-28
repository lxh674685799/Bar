//
//  ShowBarViewController.m
//  Bar
//
//  Created by 刘旭辉 on 15/2/12.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import "ShowBarViewController.h"

@interface ShowBarViewController ()

@end

@implementation ShowBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated{
    [self initView];
}

-(void)leftBtnAcion:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)initView{
    
    MyNavigationBar *navigation = [[MyNavigationBar alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, NavHeight) withTitle:@"二维码信息" withLeftTitle:@"返回" withRightTitle:@"保存" withLeftBtnHidden:NO withRightBtnHidden:NO];
    self.navigatinBar = navigation;
    self.navigatinBar.delegate = self;
    [self.view addSubview:self.navigatinBar];
    
    _user = [User objectWithKeyValues:[AppUtiles dicFromString:_jsonMsg]];
    
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
    field.text = _user.name;
    field.borderStyle = UITextBorderStyleRoundedRect;
    UITextField *field1 = [[UITextField alloc]initWithFrame:CGRectMake(90, NavHeight+40+5, ScreenWidth-95, 30)];
    field1.placeholder=@"请输入电话";
    field1.text = _user.phone;
    field1.tag = 2000;
    field1.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:field];
    [self.view addSubview:field1]; 
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((ScreenWidth - 200)/2, NavHeight+80+5,200, 30)];
    btn.titleLabel.textColor = [UIColor blackColor];
    [btn setTitle:@"保存联系人" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(saveUser) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

-(void)saveUser{
    //取得本地通信录名柄
    ABAddressBookRef tmpAddressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    ABAddressBookRequestAccessWithCompletion(tmpAddressBook, ^(bool granted, CFErrorRef error)
                                             {
                                                 dispatch_semaphore_signal(sema);
                                             });
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
    //创建一条联系人记录
    ABRecordRef tmpRecord = ABPersonCreate();
    CFErrorRef error;
    BOOL tmpSuccess = NO;
    //Nickname
//    CFStringRef tmpNickname = CFSTR("Sparky");
//    tmpSuccess = ABRecordSetValue(tmpRecord, kABPersonNicknameProperty, tmpNickname, &error);
//    CFRelease(tmpNickname);
    //First name
    CFStringRef tmpFirstName =(__bridge CFTypeRef)(_user.name);
    tmpSuccess = ABRecordSetValue(tmpRecord, kABPersonFirstNameProperty, tmpFirstName, &error);
    CFRelease(tmpFirstName);
    //Last name
//    CFStringRef tmpLastName = CFSTR("shan");
//    tmpSuccess = ABRecordSetValue(tmpRecord, kABPersonLastNameProperty, tmpLastName, &error);
//    CFRelease(tmpLastName);
    //phone number
    NSString *phoneNumber = _user.phone;
    CFTypeRef tmpPhones = (__bridge CFTypeRef)(phoneNumber);
    ABMutableMultiValueRef tmpMutableMultiPhones = ABMultiValueCreateMutable(kABPersonPhoneProperty);
    ABMultiValueAddValueAndLabel(tmpMutableMultiPhones, tmpPhones, kABPersonPhoneMobileLabel, NULL);
    tmpSuccess = ABRecordSetValue(tmpRecord, kABPersonPhoneProperty, tmpMutableMultiPhones, &error);
    CFRelease(tmpPhones);
    //保存记录
    tmpSuccess = ABAddressBookAddRecord(tmpAddressBook, tmpRecord, &error);
    CFRelease(tmpRecord);
    //保存数据库
    tmpSuccess = ABAddressBookSave(tmpAddressBook, &error);
    CFRelease(tmpAddressBook);
    
    [AppUtiles showSuccessMessage:@"保存成功"];
}

@end
