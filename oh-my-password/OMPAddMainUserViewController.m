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

@synthesize labelPasswordLength;
@synthesize textFieldUserName;
@synthesize sliderPasswordLength;
@synthesize switchNumber;
@synthesize switchChar;
@synthesize switchSymbol;
@synthesize segmentedControlCycle;


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
    [self setLabelPasswordLength:nil];
    [self setSliderPasswordLength:nil];
    [self setSwitchNumber:nil];
    [self setSwitchChar:nil];
    [self setSwitchSymbol:nil];
    [self setSegmentedControlCycle:nil];
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

- (IBAction)sliderValueChanged:(id)sender {
    if ([sender isEqual:self.sliderPasswordLength]){
        int progresAsInt = self.sliderPasswordLength.value + 0.5;
        self.labelPasswordLength.text = [[NSString alloc] initWithFormat:@"%d", progresAsInt];
    }
}

- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)checkSwitch:(id)sender {
//    if ((self.switchChar == NO) && (self.switchNumber == NO) && (self.switchSymbol == NO)) {
////        self.switchNumber = YES;
//    }
    
    if (![self.switchNumber isOn] && ![self.switchChar isOn] && ![self.switchSymbol isOn]) {
        [self.switchNumber setOn:YES];
    }
    
    
}

@end
