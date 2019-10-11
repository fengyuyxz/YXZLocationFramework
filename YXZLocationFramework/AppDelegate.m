//
//  AppDelegate.m
//  YXZLocationFramework
//
//  Created by yanxuezhou on 2019/10/10.
//  Copyright © 2019 yanxuezhou. All rights reserved.
//

#import "AppDelegate.h"
#import "YxzLocationRegisterManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSString *bdKey=@"8c8ljIkHKVAqcXEwicPeMYk6tBjiFrtG";
    NSString *gdKey=@"623a40b89402faaa4da52fc17e1fc809";
    [YxzLocationRegisterManager registerLocation:gdKey];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
