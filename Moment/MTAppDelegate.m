//
//  MTAppDelegate.m
//  Moment
//
//  Created by wangliang-ms on 14-1-20.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "MTAppDelegate.h"
#import "MTUIKit.h"
#import "MTUserDefaultsManger.h"

#if __has_feature(objc_arc)
#define MTSafeRelese(obj) {obj = nil;}
#else
#define MTSafeRelese(obj) {[obj release]; obj = nil;}
#endif

@interface MTAppDelegate()
@end

@implementation MTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [MTUserDefaultsManger changePersonalityFont:YES];
    [MTLogManager initLogs];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIViewController *rootViewController = [MTCoreAgent isUserAccountVisable]?[self _lanchNoraml]:[self _lanchLogin];
    
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return YES;
//    return [WXApi handleOpenURL:url delegate:[MTCore shareInstance]];
}

- (UIViewController*)_lanchNoraml
{
    return [[MTTabBarController alloc] init];
}

- (UIViewController*)_lanchLogin
{
    return [[MTLoginViewController alloc] init];
}
@end
