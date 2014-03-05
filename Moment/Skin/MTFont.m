//
//  MTFont.m
//  Moment
//
//  Created by wangliang-ms on 14-2-7.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "MTFont.h"
#import "MTUserDefaultsManger.h"
@implementation MTFont
+ (NSString*)fontName{
    if ([MTUserDefaultsManger isUsePersonalityFont]) {
        return @"FZMiaoWuS-GB";
    }
    return @"Helvetica";
}
@end
