//
//  Core.m
//  Core
//
//  Created by wangliang-ms on 14-2-7.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "MTCoreAgent.h"
#import "CoreAccount.h"
#import "MTShareKeysInfo.h"

@interface MTCoreAgent()
@property(nonatomic,strong)CoreAccount *account;
@end

@implementation MTCoreAgent
+ (MTCoreAgent*)shareInstance{
    static MTCoreAgent *core = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        core = [[self alloc] init];
    });
    return core;
}

- (id)init{
    if (self = [super init]) {
        _account = [[CoreAccount alloc] init];
    }
    return self;
}

+ (BOOL)isUserAccountVisable{
    return YES;
    return ([MTCoreAgent shareInstance].account.currentAccType != AccountType_None);
}

+ (void)dotest{

}

@end
