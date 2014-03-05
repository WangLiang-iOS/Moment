//
//  MTLogManager.h
//  Moment
//
//  Created by wangliang-ms on 14-2-19.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDLog.h"

#ifndef DDLOGLEVEL
#if DEBUG
#define DDLOGLEVEL
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_WARN;
#endif //DEBUG
#endif //DDLOGLEVEL

@interface MTLogManager : NSObject
+ (void)initLogs;
@end
