//
//  YxzAMLocationImple.m
//  YXZLocationFramework
//
//  Created by yanxuezhou on 2019/10/11.
//  Copyright © 2019 yanxuezhou. All rights reserved.
//

#import "YxzAMLocationImple.h"
#import <AMapFoundationKit/AMapFoundationKit.h>

#import <AMapLocationKit/AMapLocationKit.h>
@interface YxzAMLocationImple()<AMapLocationManagerDelegate>
@property(nonatomic,strong)AMapLocationManager *manager;
@end
@implementation YxzAMLocationImple
- (instancetype)init
{
    self = [super init];
    if (self) {
         _manager=[[AMapLocationManager alloc]init];
        _manager.delegate=self;
        [_manager setDesiredAccuracy:kCLLocationAccuracyBest];
        //   定位超时时间，最低2s，此处设置为2s
        _manager.locationTimeout =10;
        //   逆地理请求超时时间，最低2s，此处设置为2s
        _manager.reGeocodeTimeout = 10;
    }
    return self;
}
-(void)startLocation:(YxzLocationCompletion)block{
    [_manager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        if (!error) {
            if (block) {
                block(YES,location.coordinate,regeocode.country,regeocode.province,regeocode.city,regeocode.district,regeocode.formattedAddress);
            }
        }else{
            if (block) {
                block(NO,kCLLocationCoordinate2DInvalid,nil,nil,nil,nil,nil);
            }
        }
    }];
}
- (void)amapLocationManager:(AMapLocationManager *)manager doRequireLocationAuth:(CLLocationManager*)locationManager{
    [locationManager requestWhenInUseAuthorization];
}
@end
