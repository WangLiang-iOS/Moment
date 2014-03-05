//
//  MTSkinBase.h
//  Moment
//
//  Created by wangliang-ms on 14-2-7.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTSkinBase : NSObject
- (id)initWithBundle:(NSString*)name;
- (UIImage*)loadImage:(NSString*)name;
@end
