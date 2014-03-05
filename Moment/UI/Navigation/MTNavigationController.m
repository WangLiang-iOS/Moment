//
//  MTNavigationController.m
//  Moments
//
//  Created by wangliang-ms on 14-1-16.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "MTNavigationController.h"
#import "MTUIKit.h"

@implementation MTNavigationController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
            [self.navigationBar setBackgroundImage:[[MTSkin navigationBarBackgroundImage] stretchableImageWithLeftCapWidth:10 topCapHeight:10]forBarMetrics:UIBarMetricsDefault];
        }else
        {
            [self.navigationBar insertSubview:[[UIImageView alloc] initWithImage:[MTSkin navigationBarBackgroundImage]] atIndex:1];
        }
        if ([self.navigationBar respondsToSelector:@selector(setTitleTextAttributes:)]) {
            [self.navigationBar setTitleTextAttributes:[MTSkin navigationBarTitleTextAttributes]];
        }
    }
    return self;
}
@end
