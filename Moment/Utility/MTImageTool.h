//
//  MTImageTool.h
//  Moment
//
//  Created by wangliang-ms on 14-2-7.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTImageTool : NSObject
#pragma mark - Image Catch
+ (MTImageTool*)shareInstance;
- (UIImage*)fetchImage:(NSString*)key;
- (BOOL)saveImage:(UIImage*)image key:(NSString*)key;
- (BOOL)removeAllCatch;

#pragma mark - Tool Methods
+ (UIImage*)createImageWithColor:(UIColor*)color size:(CGSize)size;
@end
