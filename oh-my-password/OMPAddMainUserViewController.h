//
//  OMPAddMainUserViewController.h
//  oh-my-password
//
//  Created by ChenYu Xiao on 12-4-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OMPAddMainUserViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *labelPasswordLength;

@property (weak, nonatomic) IBOutlet UITextField *textFieldUserName;
@property (weak, nonatomic) IBOutlet UISlider *sliderPasswordLength;
@property (weak, nonatomic) IBOutlet UISwitch *switchNumber;
@property (weak, nonatomic) IBOutlet UISwitch *switchChar;

@property (weak, nonatomic) IBOutlet UISwitch *switchSymbol;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlCycle;




@end
