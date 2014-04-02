//
//  MTAppDelegate.h
//  Moment
//
//  Created by wangliang-ms on 14-1-20.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MTDelegate ((MTAppDelegate*)[UIApplication sharedApplication].delegate)

@interface MTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
