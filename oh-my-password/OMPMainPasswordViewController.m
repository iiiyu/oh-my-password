//
//  OMPMainPasswordViewController.m
//  oh-my-password
//
//  Created by ChenYu Xiao on 12-4-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OMPMainPasswordViewController.h"
#import "OMPCommon.h"

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
        
        /* Go through the persons array one by one */
        NSUInteger counter = 1;
        for (User *thisUser in users){
            
            NSLog(@"User %lu Name = %@",
                  (unsigned long)counter,
                  thisUser.userName);
            
            NSLog(@"Person %lu UDID = %@",
                  (unsigned long)counter,
                  thisUser.userUDID);
            
            counter++;
        }
        
    } else {
        NSLog(@"Could not find any Person entities in the context.");
    }
    
    
    
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
