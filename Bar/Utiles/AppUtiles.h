//
//  AppUtiles.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/9.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#define NET_ERROE_MSG @"请求数据失败！"

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"
#import <CommonCrypto/CommonDigest.h>

#define DEFAULT_VOID_COLOR [UIColor whiteColor]

@interface AppUtiles : NSObject

/********************** System Utils ***********************/
//弹出UIAlertView
+ (void)showAlertMessage:(NSString *)msg;
//关闭键盘
+ (void)closeKeyboard;
//获取MD5加密后字符串
+ (NSString *)md5FromString:(NSString *)str;
/******* UITableView & UINavigationController Utils *******/
//返回View覆盖多余的tableview cell线条
+ (UIView *)tableViewsFooterView;
//返回UILabel作为UITableView的header
+ (UILabel *)tableViewsHeaderLabelWithMessage:(NSString *)message;
//获取没有文字的导航栏返回按钮
+ (UIBarButtonItem *)navigationBackButtonWithNoTitle;

/********************* SVProgressHUD **********************/
//弹出操作错误信息提示框
+ (void)showErrorMessage:(NSString *)message;
//弹出请求数据失败
+ (void)showNetErrorMessage;
//弹出操作成功信息提示框
+ (void)showSuccessMessage:(NSString *)message;
//弹出加载提示框
+ (void)showProgressMessage:(NSString *) message;
//取消弹出框
+ (void)dismissHUD;

/********************** NSDate Utils ***********************/
//根据指定格式将NSDate转换为NSString yyyy-MM-dd HH:mm:ss
+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)formatter;
//根据指定格式将NSString转换为NSDate
+ (NSDate *)dateFromString:(NSString *)dateString formatter:(NSString *)formatter;

/********************* Category Utils **********************/
//根据颜色码取得颜色对象
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

/********************* Verification Utils **********************/
//验证手机号码合法性（正则）
+ (BOOL)checkPhoneNumber:(NSString *)phoneNumber;

//根据指定格式将Double转换为NSString
+ (NSString *)stringFromDouble:(double )mun;
+ (NSString *)stringFromDouble2:(double )mun;
//NSDictionary转换为NSString
+ (NSString *)stringFromDic:(NSDictionary *)dic;

+ (NSDictionary *)dicFromString:(NSString *)dic;
//去除UITableView 后的下划线
+(void)setExtraCellLineHidden: (UITableView *)tableView;
//删除所有子视图
+(void)removeAllSubView: (UIView *)view;
//删除所有子视图
+(NSString *)formateDate: (NSString *)str;

+(NSString *)formateDate2: (NSString *)str;

+(NSString *)formateNumber:(double )val formatter:(NSNumberFormatterStyle )formatterType;

+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;

+ (BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate;

@end
