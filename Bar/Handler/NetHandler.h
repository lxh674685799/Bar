//
//  NetHandler.h
//  Bar
//
//  Created by 刘旭辉 on 15/3/5.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import "BaseHandler.h"
#import "RTHttpClient.h"
@interface NetHandler : BaseHandler

@property (nonatomic ,strong)RTHttpClient *client;

/**
 *  向服务器提交数据
 *  @param 需要传递的参数
 *  @param 对应的URL
 *  @param 请求成功时的返回块
 *  @param 请求失败时的返回块
 */
- (void) requestData:(NSDictionary *)param requestUrl:(NSString *)url success:(SuccessBlock)success failed:(FailedBlock)failed;


@end
