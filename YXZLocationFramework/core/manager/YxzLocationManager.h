//
//  YxzLocationManager.h
//  YXZLocationFramework
//
//  Created by yanxuezhou on 2019/10/10.
//  Copyright © 2019 yanxuezhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
NS_ASSUME_NONNULL_BEGIN

@interface YxzLocationManager : NSObject
typedef void(^YxzLocationCompletion)(BOOL result,CLLocationCoordinate2D coordinate,NSString *countryName,NSString *provinceName,NSString *cityName,NSString *districtName,NSString *address);
-(void)startLocation:(YxzLocationCompletion)block;
+(instancetype)shareInstance;
@end

NS_ASSUME_NONNULL_END
