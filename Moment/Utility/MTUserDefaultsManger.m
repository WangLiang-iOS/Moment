//
//  MTUserDefaultsManger.m
//  Moment
//
//  Created by wangliang-ms on 14-2-7.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "MTUserDefaultsManger.h"

NSString *const useFont = @"kUseFont";
@implementation MTUserDefaultsManger
+ (BOOL)isUsePersonalityFont{
    return [[NSUserDefaults standardUserDefaults] boolForKey:useFont];
}

+ (void)changePersonalityFont:(BOOL)isUsed{
    [[NSUserDefaults standardUserDefaults] setBool:isUsed forKey:useFont];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
