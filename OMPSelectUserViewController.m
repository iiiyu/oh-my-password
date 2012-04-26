//
//  OMPSelectUserViewController.m
//  oh-my-password
//
//  Created by ChenYu Xiao on 12-4-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OMPSelectUserViewController.h"
#import "OMPMainPasswordViewController.h"
#import "OMPCommon.h"

@interface OMPSelectUserViewController ()

@end

@implementation OMPSelectUserViewController
@synthesize personsFRC = _personsFRC;

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView reloadData];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    /* Create the fetch request first */
    
//    
//    OMPDataModle *ompDataModle = [OMPDataModle shareOMPDataModle];
//    
//    /* Create the fetch request first */
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    
//    /* Here is the entity whose contents we want to read */
//    NSEntityDescription *entity = 
//    [NSEntityDescription
//     entityForName:@"User"
//     inManagedObjectContext:ompDataModle.managedObjectContext];
//    
//    /* Tell the request that we want to read the
//     contents of the Person entity */
//    [fetchRequest setEntity:entity];
//    
//    NSError *requestError = nil;
//    
//    /* And execute the fetch request on the context */
//    NSArray *users = 
//    [ompDataModle.managedObjectContext executeFetchRequest:fetchRequest
//                                                     error:&requestError];
//    
//    /* Make sure we get the array */
//    if ([users count] > 0){
//        
//        /* Go through the persons array one by one */
//        NSUInteger counter = 1;
//        for (User *thisUser in users){
//            
//            NSLog(@"User %lu Name = %@",
//                  (unsigned long)counter,
//                  thisUser.userName);
//            
//            NSLog(@"Person %lu UDID = %@",
//                  (unsigned long)counter,
//                  thisUser.userUDID);
//            
//            counter++;
//        }
//        
//    } else {
//        NSLog(@"Could not find any Person entities in the context.");
//    }

    
    OMPDataModle *ompDataModle = [OMPDataModle shareOMPDataModle];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    /* Here is the entity whose contents we want to read */
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:ompDataModle.managedObjectContext];
    
    
//    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:
//                                ageSort,
//                                firstNameSort, nil];
//    
//    fetchRequest.sortDescriptors = sortDescriptors;
    NSSortDescriptor *userNameSort = [[NSSortDescriptor alloc] initWithKey:@"userName" ascending:YES];
    
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects: userNameSort, nil];
    
    fetchRequest.sortDescriptors = sortDescriptors;
    
    /* Tell the request that we want to read the contents of the Person entity */
    [fetchRequest setEntity:entity];
    
    self.personsFRC = [[NSFetchedResultsController alloc] 
                       initWithFetchRequest:fetchRequest
                       managedObjectContext:ompDataModle.managedObjectContext
                       sectionNameKeyPath:nil
                       cacheName:nil];
    
    self.personsFRC.delegate = self;
    NSError *fetchingError = nil;
    if ([self.personsFRC performFetch:&fetchingError]){
        NSLog(@"Successfully fetched.");
    } else {
        NSLog(@"Failed to fetch.");
    }
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.personsFRC.sections
                                                    objectAtIndex:section];
    return [sectionInfo numberOfObjects];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"userCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    User *user = [self.personsFRC objectAtIndexPath:indexPath];
    
    cell.textLabel.text = user.userName;
    
    
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if ([tableView isEqual:self.tableView]){
        UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
        [ud setObject:cell.textLabel.text forKey:@"oh my password select user"];
        
        [self performSegueWithIdentifier:@"UserTableViewShowMainPasswordView" sender:self];
    
    }
    
    
    
    
}

@end
