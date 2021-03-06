//
//  ViewControllerLandscape.h
//  iOSCalculator
//
//  Created by Yacub Ali on 11/02/2015.
//  Copyright (c) 2015 Yacub Ali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface ViewControllerLandscape : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *display;
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic) BOOL userHasPressedTheSwitch;

@property (nonatomic, strong) CalculatorBrain *brain;
@property (nonatomic, weak) NSString *operation;
@property (strong, nonatomic) IBOutlet UISwitch *switchRadiantoDegrees;
@property (strong, nonatomic) IBOutlet UILabel *labelDisplaySwitchValue;

@property (nonatomic) BOOL signChange;
@property (strong, nonatomic) IBOutlet UIButton *clearAllClearButtonText;

@property (strong, nonatomic) IBOutlet UIButton *SineKey;
@property (strong, nonatomic) IBOutlet UIButton *CosKey;
@property (strong, nonatomic) IBOutlet UIButton *TanKey;

@end
