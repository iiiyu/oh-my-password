//
//  OMPViewController.m
//  oh-my-password
//
//  Created by ChenYu Xiao on 12-4-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OMPMainViewController.h"
#import "OMPAddMainUserViewController.h"

@interface OMPMainViewController ()

@end

@implementation OMPMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    OMPAddMainUserViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddMainUserViewController"];
	[self addChildViewController:viewController];
	[viewController willMoveToParentViewController:self];
	[self.view addSubview:viewController.view];
	[viewController didMoveToParentViewController:self];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
