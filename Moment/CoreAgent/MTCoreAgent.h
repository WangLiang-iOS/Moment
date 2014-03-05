//
//  Core.h
//  Core
//
//  Created by wangliang-ms on 14-2-7.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreData+MagicalRecord.h"

@interface MTCoreAgent : NSObject
+ (MTCoreAgent*)shareInstance;

+ (BOOL)isUserAccountVisable;

+ (void)dotest;
@end
