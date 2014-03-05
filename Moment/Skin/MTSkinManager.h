//
//  MTSkinManager.h
//  Moment
//
//  Created by wangliang-ms on 14-2-7.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTSkinDataSource.h"

typedef enum {
    MTSkinStyle_Default   = 0 ,// 默认皮肤
    MTSkinStyle_One            //测试皮肤1
} MTSkinStyle;

#define MTSkin [MTSkinManager sharedInstance].skin
@interface MTSkinManager : NSObject
@property (nonatomic, weak)id <MTSkinDataSource> skin;
@property (nonatomic, readonly) MTSkinStyle skinStyle;

+ (MTSkinManager *)sharedInstance;
- (void)skinStyleChange:(MTSkinStyle)style;
@end
