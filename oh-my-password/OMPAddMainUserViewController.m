//
//  OMPAddMainUserViewController.m
//  oh-my-password
//
//  Created by ChenYu Xiao on 12-4-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OMPAddMainUserViewController.h"
#import "OMPCommon.h"

@interface OMPAddMainUserViewController ()

@end

@implementation OMPAddMainUserViewController

@synthesize textFieldUserName;


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

    [self setTextFieldUserName:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)saveUserNameAction:(id)sender {
    if ([self.textFieldUserName.text isEqualToString:@""]) {
        NSLog(@"You must input a string");
    }else {
        OMPDataModle *ompDataModle = [OMPDataModle shareOMPDataModle];
        User *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:ompDataModle.managedObjectContext];
        
        if (newUser != nil) {
            newUser.userName = self.textFieldUserName.text;
            newUser.userUDID = [OpenUDID value];
            NSLog(@"udid:%@", newUser.userUDID);
            
            NSError *savingError = nil;
            
            if ([ompDataModle.managedObjectContext save:&savingError]) {
                NSLog(@"Successfully saved the context.");
            } else {
                NSLog(@"Failed to save the context. Error = %@", savingError);
            }
            
        }else {
            NSLog(@"Failed to create the new user");
        }
        
    }
    
    [self performSegueWithIdentifier:@"ShowMainPassword" sender:sender];
    
}


- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}


@end
