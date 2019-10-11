//
//  YxzAMRegisterImple.m
//  YXZLocationFramework
//
//  Created by yanxuezhou on 2019/10/10.
//  Copyright © 2019 yanxuezhou. All rights reserved.
//

#import "YxzAMRegisterImple.h"


#import <AMapFoundationKit/AMapFoundationKit.h>
@implementation YxzAMRegisterImple
-(void)registerAppkey:(NSString *)appkey{
     [AMapServices sharedServices].apiKey =appkey;
       
}
@end
