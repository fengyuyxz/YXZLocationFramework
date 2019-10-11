//
//  YxzLocationProtocol.h
//  YXZLocationFramework
//
//  Created by yanxuezhou on 2019/10/10.
//  Copyright © 2019 yanxuezhou. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>

@protocol YxzLocationProtocol <NSObject>
typedef void(^YxzLocationCompletion)(BOOL result,CLLocationCoordinate2D coordinate,NSString *countryName,NSString *provinceName,NSString *cityName,NSString *districtName,NSString *address);
-(void)startLocation:(YxzLocationCompletion)block;


@end


@protocol YxzLocationRegisterProtocal <NSObject>

-(void)registerAppkey:(NSString *)appkey;

@end
