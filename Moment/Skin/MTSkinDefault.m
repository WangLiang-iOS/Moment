//
//  MTSkinDefault.m
//  Moment
//
//  Created by wangliang-ms on 14-2-7.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "MTSkinDefault.h"
#import "MTFont.h"

@implementation MTSkinDefault
#pragma mark - NavigationBar
- (UIImage*)navigationBarBackgroundImage{
    return [self loadImage:@"actionbar_bg.png"];
}
- (NSDictionary*)navigationBarTitleTextAttributes{
    UIFont *font = [UIFont fontWithName:[MTFont fontName] size:20.f];
    return [NSDictionary dictionaryWithObjectsAndKeys:
     [UIColor colorWithRed:0xff*1.0/255.f green:0xff*1.0/255.f blue:0xff*1.0/255.f alpha:1.0],UITextAttributeTextColor, [UIColor colorWithRed:0x00*1.0/255.f green:0x00*1.0/255.f blue:0x00*1.0/255.f alpha:0.6],UITextAttributeTextShadowColor,[NSValue valueWithUIOffset:UIOffsetMake(0, 1)],UITextAttributeTextShadowOffset,font,UITextAttributeFont,nil];
}
#pragma mark - Tabbar
- (UIImage*)tabBarBackgroundImage{
    return [self loadImage:@"tab_background.png"];
}
- (UIImage*)tabBarLeftItemNormalImage{
    return [self loadImage:@"tab_feed_normal.png"];
}
- (UIImage*)tabBarLeftItemSelectedImage{
    return [self loadImage:@"tab_feed_selected.png"];
}
- (UIImage*)tabBarRightItemNormalImage{
    return [self loadImage:@"tab_profile_normal.png"];
}
- (UIImage*)tabBarRightItemSelectedImage{
    return [self loadImage:@"tab_profile_selected.png"];
}
- (UIImage*)tabBarCenterItemNormalImage{
    return [self loadImage:@"tab_camera_normal.png"];
}
- (UIImage*)tabBarCenterItemSelectedImage{
    return [self loadImage:@"tab_camera_selected.png"];
}
- (NSDictionary*)tabBarItemNormalTextAttirbutes{
    UIFont *font = [UIFont fontWithName:[MTFont fontName] size:12.f];
    return [NSDictionary dictionaryWithObjectsAndKeys:
            font, UITextAttributeFont, [UIColor grayColor],UITextAttributeTextColor, nil];
}
- (NSDictionary*)tabBarItemSelectedTextAttirbutes{
    UIFont *font = [UIFont fontWithName:[MTFont fontName] size:12.f];
    return [NSDictionary dictionaryWithObjectsAndKeys:
            font, UITextAttributeFont, [UIColor blackColor],UITextAttributeTextColor, nil];
}
#pragma mar - PublisherBar
- (UIImage*)publisherBarBackgroundImage{
    return [self loadImage:@"publishBar.png"];
}
@end
