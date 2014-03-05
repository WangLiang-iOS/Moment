//
//  MTSkinBase.m
//  Moment
//
//  Created by wangliang-ms on 14-2-7.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "MTSkinBase.h"
#import "MTImageTool.h"
#import "NSString+Ext.h"
@interface MTSkinBase()
@property(nonatomic,strong)NSBundle *bundle;
@end

@implementation MTSkinBase

- (id)initWithBundle:(NSString*)name{
    if (self = [super init]) {
        if ([name length] > 0) {
            NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"bundle"];
            if ([path length] > 0) {
                _bundle = [NSBundle bundleWithPath:path];
            }
        }
    }
    return self;
}

- (UIImage*)loadImage:(NSString*)name{
    UIImage *storeImage = [[MTImageTool shareInstance] fetchImage:name];
    if (storeImage) {
        return storeImage;
    }
    
    UIImage *image = nil;
    if (self.bundle) {
        NSString *resourcesFolder = [[self.bundle resourceURL] relativePath];
        NSString *path = [resourcesFolder stringByAppendingPathComponent:name];
        image = [UIImage imageWithContentsOfFile:path];
    }else {
        image = [UIImage imageNamed:name];
    }
    //存储到缓存中
    if(nil != image) {
//        NSString *cacheKey = [name md5];
        [[MTImageTool shareInstance] saveImage:image key:name];
    }
    return image;
}
@end
