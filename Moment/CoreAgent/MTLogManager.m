//
//  MTLogManager.m
//  Moment
//
//  Created by wangliang-ms on 14-2-19.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "MTLogManager.h"
#import "DDFileLogger.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"

NSString * const UncaughtExceptionHandlerSignalExceptionName = @"UncaughtExceptionHandlerSignalExceptionName";
NSString * const UncaughtExceptionHandlerSignalKey = @"UncaughtExceptionHandlerSignalKey";


static void handleException(NSException *exception);
@implementation MTLogManager

+ (void)initLogs{
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24 * 7; // 1 week
    fileLogger.logFileManager.maximumNumberOfLogFiles = 0;
    fileLogger.bCreateNewLogFile = YES;
    [DDLog addLogger:fileLogger];
    
    [self installUncaughtExceptionHandler];
    
}

+ (void)installUncaughtExceptionHandler{
    NSSetUncaughtExceptionHandler(&handleException);
}

void handleException(NSException *exception)
{
    NSString *exceptionName = [exception name];
    NSString *exceptionDescription = [exception description];
    NSArray *exceptionCallStackSymbols = [exception callStackSymbols];
    NSString *exceptReason = [exception reason];
    NSDictionary *exceptUserInfo = [exception userInfo];
    
    DDLogCError(@"Crash: %@", exception);
    DDLogCError(@"Name: %s", [exceptionName UTF8String]);
    DDLogCError(@"Reason: %@",exceptReason);
    DDLogCError(@"Description: %s", [exceptionDescription UTF8String]);
    DDLogCError(@"Userinfo: %s",[[exceptUserInfo description] UTF8String]);
    DDLogCError(@"Stack Trace: %s", [[exceptionCallStackSymbols description] UTF8String]);

    NSString *crashLog = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@", exceptionName,exceptReason,exceptionDescription, exceptUserInfo,exceptionCallStackSymbols];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *baseDir = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSString *logsDirectory = [baseDir stringByAppendingPathComponent:@"CrashLogs"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:logsDirectory])
    {
        NSError *err = nil;
        if (![[NSFileManager defaultManager] createDirectoryAtPath:logsDirectory
                                       withIntermediateDirectories:YES attributes:nil error:&err])
        {
            DDLogCError(@"Error creating crash logsDirectory: %@", err);
        }
    }
    

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd' 'HH'-'mm'-'ss'"];
    
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    NSString *filename = [NSString stringWithFormat:@"%@.log", dateString];

    NSString *path = [NSString stringWithFormat:@"%@/%@",logsDirectory,filename];
    NSError *error;
    if (![crashLog writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error]) {
        DDLogCError(@"write crash log file error:%@",error);
    }
    
    NSSetUncaughtExceptionHandler(NULL);
	
	if ([[exception name] isEqual:UncaughtExceptionHandlerSignalExceptionName])
	{
		kill(getpid(), [[[exception userInfo] objectForKey:UncaughtExceptionHandlerSignalKey] intValue]);
	}
	else
	{
		[exception raise];
	}
    
}

@end
