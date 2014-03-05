//
//  CoreAccount.h
//  Core
//
//  Created by wangliang-ms on 14-2-10.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    AccountType_None      = 0x00,
    AccountType_360yunpan = 0x10,
    AccountType_Weibo     = 0x20,
    AccountType_Weixin    = 0x30,
    AccountType_QQ        = 0x40,
    AccountType_QQZone    = 0x50,
    AccountType_All       = 0x60
}AccountType;

@interface CoreAccount : NSObject
@property(nonatomic,readonly)AccountType currentAccType;
- (BOOL)setUserShareType:(AccountType)type token:(NSString*)token;
- (void)loginWithShareType:(AccountType)type;
@end
