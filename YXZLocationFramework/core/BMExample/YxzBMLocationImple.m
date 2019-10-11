//
//  YxzBMLocationImple.m
//  YXZLocationFramework
//
//  Created by yanxuezhou on 2019/10/10.
//  Copyright © 2019 yanxuezhou. All rights reserved.
//

#import "YxzBMLocationImple.h"
#import <BMKLocationKit/BMKLocationComponent.h>
@interface YxzBMLocationImple()<BMKLocationManagerDelegate>
@property(nonatomic,strong)BMKLocationManager *locationManager;
@end
@implementation YxzBMLocationImple

- (instancetype)init
{
    self = [super init];
    if (self) {
        _locationManager=[[BMKLocationManager alloc]init];
        _locationManager.delegate=self;
        _locationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;
        //设置距离过滤参数
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        //设置预期精度参数
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        //设置应用位置类型
        _locationManager.activityType = CLActivityTypeAutomotiveNavigation;
        //设置是否自动停止位置更新
        _locationManager.pausesLocationUpdatesAutomatically = NO;
        
        //设置位置获取超时时间
        _locationManager.locationTimeout = 10;
        //设置获取地址信息超时时间
        _locationManager.reGeocodeTimeout = 10;
    }
    return self;
}
-(void)startLocation:(YxzLocationCompletion)block{
    [self.locationManager requestLocationWithReGeocode:YES withNetworkState:NO completionBlock:^(BMKLocation * _Nullable location, BMKLocationNetworkState state, NSError * _Nullable error) {
        if (error) {
            if (block) {
                block(NO,kCLLocationCoordinate2DInvalid,nil,nil,nil,nil,nil);
            }
        }else{
            if (block) {
               NSString *address=[NSString stringWithFormat:@"%@%@%@%@",location.rgcData.city,location.rgcData.district?location.rgcData.district:@"",location.rgcData.street?location.rgcData.street:@"",location.rgcData.streetNumber?location.rgcData.streetNumber:@""]; block(YES,location.location.coordinate,location.rgcData.country,location.rgcData.province,location.rgcData.city,location.rgcData.district,address);
            }
        }
    }];
    
}
/**
 *  @brief 当定位发生错误时，会调用代理的此方法。
 *  @param manager 定位 BMKLocationManager 类。
 *  @param error 返回的错误，参考 CLError 。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didFailWithError:(NSError * _Nullable)error{
    
}
/**
 *  @brief 为了适配app store关于新的后台定位的审核机制（app store要求如果开发者只配置了使用期间定位，则代码中不能出现申请后台定位的逻辑），当开发者在plist配置NSLocationAlwaysUsageDescription或者NSLocationAlwaysAndWhenInUseUsageDescription时，需要在该delegate中调用后台定位api：[locationManager requestAlwaysAuthorization]。开发者如果只配置了NSLocationWhenInUseUsageDescription，且只有使用期间的定位需求，则无需在delegate中实现逻辑。
 *  @param manager 定位 BMKLocationManager 类。
 *  @param locationManager 系统 CLLocationManager 类 。
 *  @since 1.6.0
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager doRequestAlwaysAuthorization:(CLLocationManager * _Nonnull)locationManager
{
    
    [locationManager requestAlwaysAuthorization];
}
@end

