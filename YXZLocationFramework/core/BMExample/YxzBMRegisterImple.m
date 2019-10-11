//
//  YxzBMRegisterImple.m
//  YXZLocationFramework
//
//  Created by yanxuezhou on 2019/10/10.
//  Copyright © 2019 yanxuezhou. All rights reserved.
//

#import "YxzBMRegisterImple.h"
#import <BMKLocationKit/BMKLocationComponent.h>
@interface YxzBMRegisterImple()<BMKLocationAuthDelegate>

@end

@implementation YxzBMRegisterImple
-(void)registerAppkey:(NSString *)appkey{
     [[BMKLocationAuth sharedInstance] checkPermisionWithKey:appkey authDelegate:self];
       
}
/**
 *@brief 返回授权验证错误
 *@param iError 错误号 : 为0时验证通过，具体参加BMKLocationAuthErrorCode
 */
- (void)onCheckPermissionState:(BMKLocationAuthErrorCode)iError{
    if (iError!=BMKLocationAuthErrorSuccess) {
        NSLog(@"授权失败 == %d",iError);
    }
}
@end
