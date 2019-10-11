//
//  YxzLocationManager.m
//  YXZLocationFramework
//
//  Created by yanxuezhou on 2019/10/10.
//  Copyright © 2019 yanxuezhou. All rights reserved.
//

#import "YxzLocationManager.h"
#import "YxzLocationProtocol.h"
@interface YxzLocationManager()
@property(nonatomic,strong)id<YxzLocationProtocol> locationManager;
@end
@implementation YxzLocationManager

+(instancetype)shareInstance{
    static YxzLocationManager *manger=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manger=[[YxzLocationManager alloc]init];
    });
    return manger;
}

-(void)startLocation:(YxzLocationCompletion)block{
    
    if (self.locationManager) {
        if ([self.locationManager respondsToSelector:@selector(startLocation:)]) {
            [self.locationManager startLocation:block];
        }
    }else{
        Class class=NSClassFromString(@"YxzAMLocationImple");
        if (!class) {
            class=NSClassFromString(@"YxzBMLocationImple");
        }
        if (class) {
            [self operationStartLocation:class withBlock:block];
        }
    }
    
    
}
-(void)operationStartLocation:(Class)claaz withBlock:(YxzLocationCompletion)block{
    if ([claaz conformsToProtocol:@protocol(YxzLocationProtocol)]) {
        id obj=[[claaz alloc]init];
        self.locationManager=obj;
        if (obj&&[obj respondsToSelector:@selector(startLocation:)]) {
            [obj performSelector:@selector(startLocation:) withObject:block];
        }else{
            if (block) {
                block(NO,kCLLocationCoordinate2DInvalid,nil,nil,nil,nil,nil);
            }
        }
    }else{
        if (block) {
            block(NO,kCLLocationCoordinate2DInvalid,nil,nil,nil,nil,nil);
        }
    }
    
}
@end
