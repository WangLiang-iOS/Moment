//
//  MTFeedViewController.m
//  Moments
//
//  Created by wangliang-ms on 14-1-16.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "MTFeedViewController.h"
#import "MTUIKit.h"
@implementation MTFeedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = localstring(@"Moment");
    DDLogInfo(@"error just test");
    DDLogInfo(@"error %@",@"is just test");
    
    [NSThread detachNewThreadSelector:@selector(doCrash) toTarget:self withObject:nil];
}

- (void)doCrash{
    NSArray *arr = @[@"1",@"2"];
    DDLogInfo(@"%@",arr[2]);
}
@end
