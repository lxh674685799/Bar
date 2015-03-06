//
//  NetHandler.m
//  Bar
//
//  Created by 刘旭辉 on 15/3/5.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import "NetHandler.h"

@implementation NetHandler

- (id)init{
    if (self = [super init]){
        _client = [[RTHttpClient alloc]init];;
    }
    return self;
}

- (void) requestData:(NSDictionary *)param requestUrl:(NSString *)url success:(SuccessBlock)success failed:(FailedBlock)failed{
    
    NSString *path = [BaseHandler requestUrlWithPath:url];
    PrepareExecuteBlock prepareExecute =^(void){
        [AppUtiles showProgressMessage:@"加载中......"];
    };
    
    [_client requestWithPath:path method:RTHttpRequestPost parameters:param prepareExecute:prepareExecute success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }failure:^(NSURLSessionDataTask *task, NSError *error){
        failed(error);
    }];
}
@end
