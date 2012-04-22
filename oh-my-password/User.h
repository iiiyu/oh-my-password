//
//  User.h
//  oh-my-password
//
//  Created by ChenYu Xiao on 12-4-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * userUDID;
@property (nonatomic, retain) NSString * userKey;
@property (nonatomic, retain) NSNumber * userDefaultUpdateCycle;
@property (nonatomic, retain) NSNumber * userDefaultPasswordLength;
@property (nonatomic, retain) NSNumber * userDefaultPasswordType;

@end
