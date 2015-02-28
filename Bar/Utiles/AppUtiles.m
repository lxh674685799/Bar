//
//  AppUtiles.m
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/9.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//

#import "AppUtiles.h"

@implementation AppUtiles

/********************* System Utils **********************/
+ (void)showAlertMessage:(NSString *)msg
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:msg message:nil delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
    [alertView show];
}

+ (void)closeKeyboard
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

+ (NSString *)md5FromString:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (int)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

/******* UITableView & UINavigationController Utils *******/
+ (UILabel *)tableViewsHeaderLabelWithMessage:(NSString *)message
{
    UILabel *lb_headTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 20)];
    lb_headTitle.font = [UIFont boldSystemFontOfSize:15.0];
    lb_headTitle.textColor = [UIColor darkGrayColor];
    lb_headTitle.textAlignment = NSTextAlignmentCenter;
    lb_headTitle.text = message;
    return lb_headTitle;
}

+ (UIView *)tableViewsFooterView
{
    UIView *coverView = [UIView new];
    coverView.backgroundColor = [UIColor clearColor];
    return coverView;
}

+ (UIBarButtonItem *)navigationBackButtonWithNoTitle
{
    return [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

/********************* SVProgressHUD **********************/
+ (void)showSuccessMessage:(NSString *)message
{
    [SVProgressHUD showSuccessWithStatus:message];
}

+ (void)showErrorMessage:(NSString *)message
{
    [SVProgressHUD showErrorWithStatus:message];
}

//弹出请求数据失败
+ (void)showNetErrorMessage{
    [self showErrorMessage:NET_ERROE_MSG];
}

+ (void)showProgressMessage:(NSString *) message
{
    [SVProgressHUD showWithStatus:message];
}

+ (void)dismissHUD
{
    [SVProgressHUD dismiss];
}

/********************** NSDate Utils ***********************/
+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)formatter
{
    NSTimeZone* localzone =[[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
   
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setTimeZone:localzone];
    
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter stringFromDate:date];
    
  
}

+ (NSDate *)dateFromString:(NSString *)dateString formatter:(NSString *)formatter;
{
//    NSTimeZone* localzone =[[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    
//    [dateFormatter setTimeZone:localzone];
//    
//    [dateFormatter setDateFormat:formatter];
//    return [dateFormatter dateFromString:dateString];
    
    NSTimeZone* GTMzone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    [dateFormatter setTimeZone:GTMzone];
    NSDate *bdate = [dateFormatter dateFromString:dateString];
    return bdate;
}

/********************* Category Utils **********************/
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6)
        return DEFAULT_VOID_COLOR;
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return DEFAULT_VOID_COLOR;
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

/********************* Verification Utils **********************/
+ (BOOL)checkPhoneNumber:(NSString *)phoneNumber{
    
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    BOOL res1 = [regextestmobile evaluateWithObject:phoneNumber];
    BOOL res2 = [regextestcm evaluateWithObject:phoneNumber];
    BOOL res3 = [regextestcu evaluateWithObject:phoneNumber];
    BOOL res4 = [regextestct evaluateWithObject:phoneNumber];
    
    if (res1 || res2 || res3 || res4 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (NSString *)stringFromDouble:(double )mun{
    if (mun != 0 ) {
        return   [[NSString alloc]initWithFormat:@"%.0f",mun];
    }
    
    return nil;
}

+ (NSString *)stringFromDouble2:(double )mun{
     if (mun != 0 ) {
    return  [[NSString alloc]initWithFormat:@"%.2f",mun];
     }
    return  nil;
}

//NSDictionary转换为NSString
+ (NSString *)stringFromDic:(NSDictionary *)dic{
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonStr;
}

+ (NSDictionary *)dicFromString:(NSString *)str{
    NSDictionary *string2dic = [NSJSONSerialization JSONObjectWithData: [str dataUsingEncoding:NSUTF8StringEncoding]options: NSJSONReadingMutableContainers
                                                                 error: nil];
    return string2dic;
}

//去除UITableView 后的下划线
+(void)setExtraCellLineHidden: (UITableView *)tableView{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}


//删除所有子视图
+(void)removeAllSubView: (UIView *)view{
    for(id tmpView in [view subviews])
    {
        [tmpView removeFromSuperview];
    }
}


+(NSString *)formateDate: (NSString *)str{
    if (str != nil && ![str isEqualToString:@""]) {
        return [str substringToIndex:str.length - 9];
    }
        return @"";
}

+(NSString *)formateDate2: (NSString *)str{
    if (str != nil && ![str isEqualToString:@""]) {
        return [str substringToIndex:str.length - 3];
    }
    return @"";
}

+(NSString *)formateNumber:(double )val formatter:(NSNumberFormatterStyle )formatterType{
    
//    enum {
//        NSNumberFormatterNoStyle = kCFNumberFormatterNoStyle,
//        NSNumberFormatterDecimalStyle = kCFNumberFormatterDecimalStyle,
//        NSNumberFormatterCurrencyStyle = kCFNumberFormatterCurrencyStyle,
//        NSNumberFormatterPercentStyle = kCFNumberFormatterPercentStyle,
//        NSNumberFormatterScientificStyle = kCFNumberFormatterScientificStyle,
//        NSNumberFormatterSpellOutStyle = kCFNumberFormatterSpellOutStyle
//    };
//    typedef NSUInteger NSNumberFormatterStyle;
//    各个枚举对应输出数字格式的效果如下：
//    [1243:403] Formatted number string:123456789
//    [1243:403] Formatted number string:123,456,789
//    [1243:403] Formatted number string:￥123,456,789.00
//    [1243:403] Formatted number string:-539,222,988%
//    [1243:403] Formatted number string:1.23456789E8
//    [1243:403] Formatted number string:一亿二千三百四十五万六千七百八十九
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = formatterType;
    NSString *string = [formatter stringFromNumber:[NSNumber numberWithDouble:val]];
    return string;
}

+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}


+ (BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate
{
    if ([date compare:beginDate] == NSOrderedAscending)
    return NO;
    
    if ([date compare:endDate] == NSOrderedDescending)
    return NO;
    
    return YES;
}

//+(NSString *)uploadImage:(NSData*) imageData{
//    NSData *data=imageData;
//    PicOperation *pic = [[PicOperation alloc] init];
//    NSDictionary *result = [pic UpLoading:data];
//    NSString *path = [result valueForKey:@"filePath"];
//    return path;
//}

@end
