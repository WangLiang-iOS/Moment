//
//  CoreAccount.m
//  Core
//
//  Created by wangliang-ms on 14-2-10.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "CoreAccount.h"

@implementation CoreAccount

- (id)init{
    if (self = [super init]) {
        _currentAccType = AccountType_None;
    }
    return self;
}

- (BOOL)setUserShareType:(AccountType)type token:(NSString*)token{
    return YES;
}

- (void)loginWithShareType:(AccountType)type{
    
}
@end
