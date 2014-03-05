//
//  MTTabBarController.m
//  Moments
//
//  Created by wangliang-ms on 14-1-16.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "MTTabBarController.h"
#import "MTUIKit.h"
#import "MTImageTool.h"

@interface MTTabBarController ()
@property(nonatomic,strong)MTPublisherBarViewController *publisherBar;
@end
@implementation MTTabBarController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIImage *tabBarImage = [MTSkin tabBarBackgroundImage];
        if([self.tabBar respondsToSelector:@selector(setBackgroundImage:)]){
            [self.tabBar setBackgroundImage:[tabBarImage stretchableImageWithLeftCapWidth:2 topCapHeight:2]];
        }
        if ([self.tabBar respondsToSelector:@selector(setSelectionIndicatorImage:)]) {
            [self.tabBar setSelectionIndicatorImage:[MTImageTool createImageWithColor:[UIColor clearColor] size:CGSizeZero]];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tabBar.layer setMasksToBounds:NO];

    MTFeedViewController *feedViewController = [[MTFeedViewController alloc] init];
    MTNavigationController *feedNav = [[MTNavigationController alloc] initWithRootViewController:feedViewController];
    
    MTProfileViewController *homeViewController = [[MTProfileViewController alloc] init];
    MTNavigationController *homeNav = [[MTNavigationController alloc] initWithRootViewController:homeViewController];
    self.viewControllers = @[[self viewControllerWithTabTitle:localstring(@"Moment") image:[MTSkin tabBarLeftItemNormalImage] selectImage:[MTSkin tabBarLeftItemSelectedImage] viewController:feedNav],[self viewControllerWithTabTitle:nil image:nil  selectImage:nil viewController:nil],[self viewControllerWithTabTitle:localstring(@"Persion") image:[MTSkin tabBarRightItemNormalImage]  selectImage:[MTSkin tabBarRightItemSelectedImage] viewController:homeNav]];
    
    UIImage *centerNormalImg = [MTSkin tabBarCenterItemNormalImage];
    UIImage *centerSelectedImg = [MTSkin tabBarCenterItemSelectedImage];
    [self addCenterButtonWithImage:centerNormalImg highlightImage:centerSelectedImg target:self action:@selector(centerButtonClicked)];
}

-(UIViewController*) viewControllerWithTabTitle:(NSString*) title image:(UIImage*)image selectImage:(UIImage*)selectImage viewController:(UIViewController*)viewController
{
    UIViewController* controller = nil;
    if(nil  == viewController){
        controller = [[UIViewController alloc] init];
        [[controller tabBarItem] setEnabled:NO];
    }
    else{
        controller = viewController;
        if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
            controller.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image tag:0];
            if ([controller.tabBarItem respondsToSelector:@selector(setFinishedSelectedImage:withFinishedUnselectedImage:)]) {
                [controller.tabBarItem setFinishedSelectedImage:selectImage withFinishedUnselectedImage:image];
            }
        }else{
            image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            selectImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            controller.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectImage];
        }
        [[controller tabBarItem] setEnabled:YES];
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0) {
            [controller.tabBarItem setTitleTextAttributes:[MTSkin tabBarItemSelectedTextAttirbutes] forState:UIControlStateSelected];
            
            [controller.tabBarItem setTitleTextAttributes:[MTSkin tabBarItemNormalTextAttirbutes] forState:UIControlStateNormal];
        }
    }
    
    return controller;
}

-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage target:(id)target action:(SEL)action
{
    UIButton *_CenterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _CenterButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    _CenterButton.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [_CenterButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [_CenterButton setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0){
        _CenterButton.center = self.tabBar.center;
    }else{
        _CenterButton.frame = CGRectMake(self.tabBar.frame.size.width/2-buttonImage.size.width/2, self.tabBar.frame.size.height-buttonImage.size.height, buttonImage.size.width, buttonImage.size.height);
    }
    
    [_CenterButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:_CenterButton];
}

-(void)centerButtonClicked
{
    if (!self.publisherBar) {
        self.publisherBar = [[MTPublisherBarViewController alloc] init];
    }
    
    self.publisherBar.view.hidden = NO;
    if ([[MTDelegate.window subviews] containsObject:self.publisherBar.view]) {
        [self.publisherBar.view removeFromSuperview];
    }
    [MTDelegate.window addSubview:self.publisherBar.view];
    [self.publisherBar showPublisherBar];
}
@end
