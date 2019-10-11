//
//  ViewController.m
//  YXZLocationFramework
//
//  Created by yanxuezhou on 2019/10/10.
//  Copyright © 2019 yanxuezhou. All rights reserved.
//

#import "ViewController.h"
#import "YxzLocationManager.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)butPressed:(UIButton *)sender {
    YxzLocationManager *manager=[YxzLocationManager shareInstance];
    [manager startLocation:^(BOOL result, CLLocationCoordinate2D coordinate, NSString * _Nonnull countryName, NSString * _Nonnull provinceName, NSString * _Nonnull cityName, NSString * _Nonnull districtName, NSString * _Nonnull address) {
        if (result) {
            self.locationLabel.text=address;
        }else{
            self.locationLabel.text=@"定位失败";
        }
    }];
}


@end
