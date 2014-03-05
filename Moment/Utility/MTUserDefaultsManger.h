//
//  MTUserDefaultsManger.h
//  Moment
//
//  Created by wangliang-ms on 14-2-7.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString *const useFont;
@interface MTUserDefaultsManger : NSObject
+ (BOOL)isUsePersonalityFont;
+ (void)changePersonalityFont:(BOOL)isUsed;
@end
