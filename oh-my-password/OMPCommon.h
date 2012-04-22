//
//  OMPCommon.h
//  oh-my-password
//
//  Created by ChenYu Xiao on 12-4-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef oh_my_password_OMPCommon_h
#define oh_my_password_OMPCommon_h

#import "NSData+AESCrypt.h"
#import "NSString+AESCrypt.h"

// set eunm userDefaultUpdateCycle
typedef enum { 
    MONTH_UPDATE, // Monthly prompted to update time
    QUARTER_UPDATE, // Quarterly prompted to update time
    HALF_YEAR_UPDATE // Six months prompted to update time
} 
enumUserDefaultUpdateCycle;

// set enum userDefaultPasswordType
typedef enum  {
    NONE_TYPE = 0, 
    ONLY_NUMBER = 1 << 0,
    ONLY_CHAR = 1 << 1,
    ONLY_SYMBOL = 1 << 2,
    NUMBER_CHAR = (ONLY_NUMBER | ONLY_CHAR),
    NUMBER_SYMBOL = (ONLY_NUMBER | ONLY_SYMBOL),
    CHAR_SYMBOL = (ONLY_CHAR | ONLY_SYMBOL),
    NUMBER_CHAR_SYMBOL = (ONLY_NUMBER | ONLY_CHAR | ONLY_SYMBOL)
}
enumuserDefaultPasswordType;












#endif
