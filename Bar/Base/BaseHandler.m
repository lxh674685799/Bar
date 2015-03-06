//
//  BaseHandler.m
//  Bar
//
//  Created by 刘旭辉 on 15/3/5.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import "BaseHandler.h"

@implementation BaseHandler

+ (NSString *)requestUrlWithPath:(NSString *)path
{
    return [[@"https://" stringByAppendingString:[SERVER_HOST stringByAppendingString:@""]] stringByAppendingString:path];
}

@end
