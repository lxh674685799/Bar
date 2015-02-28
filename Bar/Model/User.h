//
//  User.h
//  Bar
//
//  Created by 刘旭辉 on 15/2/12.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import "BaseModel.h"

@interface User : BaseModel

/**
 *  @author 刘旭辉, 15-02-12 16:02:28
 *
 *  联系人姓名
 */
@property(nonatomic ,strong)NSString *name;
/**
 *  @author 刘旭辉, 15-02-12 16:02:41
 *
 *  联系人电话
 */
@property(nonatomic ,strong)NSString *phone;
@end
