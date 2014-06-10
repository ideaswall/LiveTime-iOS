//
//  iwMainViewController.m
//  LiveTime
//
//  Created by Wayn Liu on 14-6-5.
//  Copyright (c) 2014年 IDEASWALL. All rights reserved.
//

#import "iwMainViewController.h"
#import "iwLeftViewController.h"

@interface iwMainViewController ()

@end

@implementation iwMainViewController

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
        self.contentViewShadowColor = [UIColor blackColor];
        self.contentViewShadowOffset = CGSizeMake(0, 0);
        self.contentViewShadowOpacity = 0.6;
        self.contentViewShadowRadius = 12;
        self.contentViewShadowEnabled = YES;
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        
        UINavigationController *mainNavigationController = [storyBoard instantiateViewControllerWithIdentifier:@"MainNavigationControlller"];
        self.contentViewController = mainNavigationController;
        
        iwLeftViewController *leftViewController = [[iwLeftViewController alloc] init];
        self.leftMenuViewController = leftViewController;
        
        self.backgroundImage = [UIImage imageNamed:@"Stars"];
        self.delegate = self;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
