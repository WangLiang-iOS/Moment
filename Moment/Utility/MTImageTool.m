//
//  MTImageTool.m
//  Moment
//
//  Created by wangliang-ms on 14-2-7.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "MTImageTool.h"
static NSUInteger const kCacheCapacityBytes = 20*1024*1024;
static NSInteger const kCacheInitialSize = 50;

@interface MTImageTool ()
@property(nonatomic,strong)NSMutableDictionary* mCache;
@property(nonatomic,strong)NSMutableArray* mKeys;
@property(nonatomic,assign)int mTotalBytes;
@end

@implementation MTImageTool

#pragma mark - Image Catch
+ (MTImageTool*)shareInstance{
    static MTImageTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[self alloc] init];
    });
    return tool;
}

- (id)init{
    if (self = [super init]) {
        _mCache = [[NSMutableDictionary alloc] initWithCapacity:kCacheInitialSize];
		_mKeys = [[NSMutableArray alloc] initWithCapacity:kCacheInitialSize];
		_mTotalBytes = 0;
        
		[[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(_cleanUp)
         name:UIApplicationDidReceiveMemoryWarningNotification
         object:nil];
    }
    return self;
}

- (void)_cleanUp{
    [_mKeys removeAllObjects];
    [_mCache removeAllObjects];
    _mTotalBytes = 0;
}

- (UIImage*)fetchImage:(NSString*)key{
    UIImage * image = [_mCache objectForKey:key];
	if (image)
	{
		[_mKeys removeObject:key];
		[_mKeys addObject:key];
	}
	return image;
}

- (BOOL)saveImage:(UIImage*)image key:(NSString*)key{
    UIImage *existedImage = [_mCache objectForKey:key];
	if (existedImage)
	{
		_mTotalBytes -= [self _roughImageSizeInBytes:existedImage];
		[_mKeys removeObject:key];
	}
    if ([_mCache count] >= kCacheInitialSize || [_mKeys count] >= kCacheInitialSize) {
        NSString *key = [_mKeys objectAtIndex:0];
        [_mCache removeObjectForKey:key];
        [_mKeys removeObject:key];
    }
	[_mCache setObject:image forKey:key];
	[_mKeys addObject:key];
	_mTotalBytes += [self _roughImageSizeInBytes:image];

	while (_mTotalBytes > kCacheCapacityBytes)
	{
		NSString * leastRecentlyUsedKey = [_mKeys objectAtIndex:0];
		UIImage * imageToRemove = [_mCache objectForKey:leastRecentlyUsedKey];
		_mTotalBytes -= [self _roughImageSizeInBytes:imageToRemove];
		[_mCache removeObjectForKey:leastRecentlyUsedKey];
		[_mKeys removeObjectAtIndex:0];
	}
    return YES;
}

- (NSUInteger)_roughImageSizeInBytes:(UIImage*)image{
	CGImageRef cgImage = image.CGImage;
	NSUInteger sizeBytes = CGImageGetBytesPerRow(cgImage) * CGImageGetHeight(cgImage);
	return sizeBytes;
}

- (BOOL)removeAllCatch{
    [self removeAllCatch];
    return YES;
}

+ (UIImage*)createImageWithColor:(UIColor*)color size:(CGSize)size{
    CGRect rect=CGRectMake(0.0f, 0.0f, size.width > 0.f ? size.width : 1.0f, size.height > 0.f ? size.height : 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
