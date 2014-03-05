//
//  MTPublisherBarViewController.m
//  Moment
//
//  Created by wangliang-ms on 14-2-10.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "MTPublisherBarViewController.h"
#import "MTUIKit.h"
@interface MTPublisherBarViewController ()
@property(nonatomic,strong)UIImageView *barView;
@end

@implementation MTPublisherBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    
    UIImage *backgroundImage = [MTSkin publisherBarBackgroundImage];
    self.barView = [[UIImageView alloc] initWithImage:backgroundImage];
    self.barView.userInteractionEnabled = YES;
    self.barView.frame = CGRectMake(([UIScreen mainScreen].applicationFrame.size.width - self.barView.image.size.width)/2.0f, [UIScreen mainScreen].applicationFrame.size.height-self.barView.image.size.height-49.f-20.f, self.barView.image.size.width, self.barView.image.size.height);
    [self.view addSubview:self.barView];
}

- (void)showPublisherBar{
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.view.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
