//
//  MTSkinManager.m
//  Moment
//
//  Created by wangliang-ms on 14-2-7.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "MTSkinManager.h"
#import "MTSkinDefault.h"

@interface MTSkinManager ()
@property(nonatomic,strong)MTSkinDefault *defaultSkin;
@end
@implementation MTSkinManager

+ (MTSkinManager *)sharedInstance{
    static MTSkinManager *skinMgr = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        skinMgr = [[self alloc] init];
    });
    return skinMgr;
}

- (id)init{
    if (self = [super init]) {
        _defaultSkin = [[MTSkinDefault alloc] initWithBundle:@"DefaultSkin"];
        [self skinStyleChange:MTSkinStyle_Default];
    }
    return self;
}

- (void)skinStyleChange:(MTSkinStyle)style{
    switch (style) {
        case MTSkinStyle_Default:
            self.skin = self.defaultSkin;
            break;
            
        default:
            break;
    }
    
    _skinStyle = style;
}
@end
