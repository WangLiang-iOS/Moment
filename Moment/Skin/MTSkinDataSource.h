//
//  MTSkinDataSource.h
//  Moment
//
//  Created by wangliang-ms on 14-2-7.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MTSkinDataSource <NSObject>
@optional
#pragma mark - NavigationBar
- (UIImage*)navigationBarBackgroundImage;
- (NSDictionary*)navigationBarTitleTextAttributes;
#pragma mark - Tabbar
- (UIImage*)tabBarBackgroundImage;
- (UIImage*)tabBarLeftItemNormalImage;
- (UIImage*)tabBarLeftItemSelectedImage;
- (UIImage*)tabBarRightItemNormalImage;
- (UIImage*)tabBarRightItemSelectedImage;
- (UIImage*)tabBarCenterItemNormalImage;
- (UIImage*)tabBarCenterItemSelectedImage;
- (NSDictionary*)tabBarItemNormalTextAttirbutes;
- (NSDictionary*)tabBarItemSelectedTextAttirbutes;
#pragma mar - PublisherBar
- (UIImage*)publisherBarBackgroundImage;
@end
