//
//  OMPMainPasswordViewController.m
//  oh-my-password
//
//  Created by ChenYu Xiao on 12-4-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OMPMainPasswordViewController.h"

@interface OMPMainPasswordViewController ()

@end

@implementation OMPMainPasswordViewController

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)buttonShowAccount:(id)sender {

//    [self performSegueWithIdentifier:@"ShowAccountData" sender:sender];
    
}


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//	NSString *identifier = [segue identifier];
//	if ([identifier isEqualToString:@"ShowMonthView"] || [identifier isEqualToString:@"ShowWeatherView"]) {
//		[segue.destinationViewController setDelegate:self];
//	}
//	else if ([identifier isEqualToString:@"ShowMoreView"]) {
//		UINavigationController *navigationController = segue.destinationViewController;
//		MoreViewController *viewController = (MoreViewController *)navigationController.topViewController;
//		viewController.delegate = self;
//	}
//}

@end
