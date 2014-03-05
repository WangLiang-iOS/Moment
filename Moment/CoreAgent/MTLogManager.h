//
//  MTLogManager.h
//  Moment
//
//  Created by wangliang-ms on 14-2-19.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDLog.h"

#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_WARN;
#endif

@interface MTLogManager : NSObject
+ (void)initLogs;
@end
