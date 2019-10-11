//
//  YxzLocationRegisterManager.m
//  YXZLocationFramework
//
//  Created by yanxuezhou on 2019/10/10.
//  Copyright © 2019 yanxuezhou. All rights reserved.
//

#import "YxzLocationRegisterManager.h"
#import "YxzLocationProtocol.h"
@implementation YxzLocationRegisterManager
+(void)registerLocation:(NSString *)key{
    
    Class class=NSClassFromString(@"YxzAMRegisterImple");
    if (!class) {
        class=NSClassFromString(@"YxzBMRegisterImple");
    }
    if (class) {
        [self operationRegister:class withKey:key];
    }
}

+(void)operationRegister:(Class)claaz withKey:(NSString *)key{
    if ([claaz conformsToProtocol:@protocol(YxzLocationRegisterProtocal)]) {
        id obj=[[claaz alloc]init];
        if (obj&&[obj respondsToSelector:@selector(registerAppkey:)]) {
            [obj performSelector:@selector(registerAppkey:) withObject:key];
        }
    }
    
}
@end
