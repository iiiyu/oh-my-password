//
//  OMPViewController.m
//  oh-my-password
//
//  Created by ChenYu Xiao on 12-4-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OMPMainViewController.h"
#import "OMPAddMainUserViewController.h"
#import "OMPSelectUserViewController.h"
#import "OMPMainPasswordViewController.h"
#import "OMPCommon.h"

@interface OMPMainViewController ()

@end

@implementation OMPMainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *udUserName = [ud objectForKey:@"oh my password select user"];
    if (udUserName) {
//        OMPMainPasswordViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:
//                                                         @"MainPasswordViewController"];
//        [self addChildViewController:viewController];
//        [viewController willMoveToParentViewController:self];
//        [self.view addSubview:viewController.view];
//        [viewController didMoveToParentViewController:self];
        
        [self performSegueWithIdentifier:@"ShowMainPasswordView" sender:self];
    }
    else {
        OMPDataModle *ompDataModle = [OMPDataModle shareOMPDataModle];
        /* Create the fetch request first */
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        
        /* Here is the entity whose contents we want to read */
        NSEntityDescription *entity = 
        [NSEntityDescription
         entityForName:@"User"
         inManagedObjectContext:ompDataModle.managedObjectContext];
        
        /* Tell the request that we want to read the
         contents of the Person entity */
        [fetchRequest setEntity:entity];
        
        NSError *requestError = nil;
        
        /* And execute the fetch request on the context */
        NSArray *users = 
        [ompDataModle.managedObjectContext executeFetchRequest:fetchRequest
                                                         error:&requestError];
        
        /* Make sure we get the array */
        if ([users count] > 0){
            NSLog(@"Find user.");
//            OMPSelectUserViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectUserViewController"];
//            [self addChildViewController:viewController];
//            [viewController willMoveToParentViewController:self];
//            [self.view addSubview:viewController.view];
//            [viewController didMoveToParentViewController:self];
            
            [self performSegueWithIdentifier:@"ShowSelectUserView" sender:self];
            
        } else {
//            NSLog(@"Could not find any Person entities in the context.");
//            OMPAddMainUserViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddMainUserViewController"];
//            [self addChildViewController:viewController];
//            [viewController willMoveToParentViewController:self];
//            [self.view addSubview:viewController.view];
//            [viewController didMoveToParentViewController:self];
            [self performSegueWithIdentifier:@"ShowAddUserView" sender:self];
        }
        
    }
    
    
    
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidDisappear:(BOOL)animated 
{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}


@end
