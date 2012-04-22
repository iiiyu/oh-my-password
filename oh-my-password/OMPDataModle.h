//
//  OMPDataModle.h
//  oh-my-password
//
//  Created by ChenYu Xiao on 12-4-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OMPDataModle : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (OMPDataModle *)shareOMPDataModle;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;



@end
