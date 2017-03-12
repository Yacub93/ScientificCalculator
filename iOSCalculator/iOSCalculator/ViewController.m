//
//  ViewController.m
//  iOSCalculator
//
//  Created by Yacub Ali on 06/02/2015.
//  Copyright (c) 2015 Yacub Ali. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic)NSString *resultText;

@end

@implementation ViewController
@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize userHasPressedTheSwitch = _userHasPressedTheSwitch;
@synthesize brain = _brain;
@synthesize operation = _operation;
@synthesize SineKey = _SineKey;
@synthesize CosKey = _CosKey;
@synthesize TanKey = _TanKey;
@synthesize SinehKey = _SinehKey;
@synthesize CoshKey = _CoshKey;
@synthesize TanhKey = _TanhKey;
@synthesize clearAllClearButtonText = _clearAllClearButtonText;
@synthesize signChange = _signChange;
@synthesize switchRadiantoDegrees = _switchRadiantoDegrees;
@synthesize labelDisplaySwitchValue = _labelDisplaySwitchValue;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _display.text = @"0";
    [_display setFont:[UIFont fontWithName:@"DBLCDTempBlack" size:52.0]];
    _labelDisplaySwitchValue.text = @"Degrees";
    _userHasPressedTheSwitch  = NO;
    
}
-(CalculatorBrain *) brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
    
}
-(void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    //you code here to handle programatic segue
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        NSLog(@"Landscape left");
        [self performSegueWithIdentifier:@"LandscapeView" sender:self];
        
        
    }
    else if(toInterfaceOrientation == UIInterfaceOrientationLandscapeRight){
            [self performSegueWithIdentifier:@"LandscapeView" sender:self];
        NSLog(@"Portrait");
        }

    else if(toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){
        //[self performSegueWithIdentifier:@"PortraitView" sender:self];

       NSLog(@"UpsideDown");
    }
    
}

- (IBAction)digitPressed:(id)sender {
    NSString *digit = [sender currentTitle];
    

    [_clearAllClearButtonText setTitle:@"C" forState:UIControlStateNormal];
    
    if ([_display.text isEqualToString:@"0"]) {
        _display.text =@"";
        if (digit == 0) {
            _display.text =@"0";
        }
    }
    if (_userIsInTheMiddleOfEnteringANumber) {
         _display.text = [_display.text stringByAppendingString:digit];
    }
    else{
        _display.text = digit;
        _userIsInTheMiddleOfEnteringANumber = YES;
        
    }
   
    
}
-(IBAction)equalsPressed{
    [self.brain getOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    double result = [self.brain performCalculation: _operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}
-(IBAction)decimalPressed:(id)sender{
    NSRange range = [self.display.text rangeOfString:@"."];
    if (range.location == NSNotFound) {
        self.display.text = [self.display.text stringByAppendingFormat:@"."];
    }
    self.userIsInTheMiddleOfEnteringANumber = YES;
}

-(IBAction)CPressed {
    self.display.text = @"0";
}
//Clear and All Clear buttons
-(IBAction)ClearAllClearPressed:(id)sender {
    
    NSString *state_ = [sender currentTitle];
    if ([state_ isEqualToString:@"C"]) {
        _signChange = NO;
        _display.text = @"0";
        [_clearAllClearButtonText setTitle:@"AC" forState:UIControlStateNormal];
        
    }
    if ([state_ isEqualToString:@"AC"]) {
        _signChange = NO;
        [self.brain clearMemory];
        _display.text = @"0";
        _userIsInTheMiddleOfEnteringANumber = NO;
    }
}
//Negative and Positive Button
-(IBAction)negativePositivePressed:(id)sender {
    if ([_display.text isEqualToString:@"0"]) {
        return;
    }
    else{
        NSString *negative = @"-";
        if (!_signChange) {
            _signChange = YES;
            _display.text = [negative stringByAppendingString:_display.text];
        }else{
             _signChange = NO;
            _display.text = [self.display.text substringFromIndex:1];
        }
    }
}

-(IBAction)operationPressed:(id)sender{
    _operation = [sender currentTitle];
    
    [self.brain getOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}




- (IBAction)SinButton:(id)sender{
    double sinoper = 0.0;
    NSString *operation = [sender currentTitle];
    // if ([operation isEqualToString:@"sin"]) {
    
    if (!_userHasPressedTheSwitch) {
        
        if ([_SineKey.titleLabel.text isEqualToString:@"arcsin\u207B\u00B9"]) { // if button is sin -1
            operation = @"sin\u207B\u00B9"; // arc sin degrees
        } else {
            operation = @"sind"; // sin degrees
        }
        
    } else if (_userHasPressedTheSwitch){ // switch on to radians
        
        if ([_SineKey.titleLabel.text isEqualToString:@"arcsin\u207B\u00B9"]) { // if button is sin -1
            operation = @"arcsin\u207B\u00B9"; // arc sin radians
        } else {
            operation = @"sinr"; // sin radians
        }
    }
    
    
    [self.brain getOperand:[self.display.text doubleValue]];
    sinoper = [self.brain performCalculation:operation];
    [_display setText:[NSString stringWithFormat:@"%g", sinoper]];

}


- (IBAction)CosButton:(id)sender{
    double cosoper = 0.0;
    NSString *operation = [sender currentTitle];

    
    if (!_userHasPressedTheSwitch) {
        
        if ([_CosKey.titleLabel.text isEqualToString:@"arccos\u207B\u00B9"]) { // if button is sin -1
            operation = @"cos\u207B\u00B9"; // arc sin degrees
        } else {
            operation = @"cosd"; // sin degrees
        }
        
    } else if (_userHasPressedTheSwitch){ // switch on to radians
        
        if ([_CosKey.titleLabel.text isEqualToString:@"arccos\u207B\u00B9"]) { // if button is sin -1
            operation = @"arccos\u207B\u00B9"; // arc sin radians
        } else {
            operation = @"cosr"; // sin radians
        }
    }

    
    
    
    [self.brain getOperand:[self.display.text doubleValue]];
    cosoper = [self.brain performCalculation:operation];
    [_display setText:[NSString stringWithFormat:@"%g", cosoper]];
}



- (IBAction)TanButton:(id)sender{
    double tanoper = 0.0;
    NSString *operation = [sender currentTitle];

    
    if (!_userHasPressedTheSwitch) {
        
        if ([_TanKey.titleLabel.text isEqualToString:@"arctan\u207B\u00B9"]) { // if button is sin -1
            operation = @"tan\u207B\u00B9"; // arc sin degrees
        } else {
            operation = @"tand"; // sin degrees
        }
        
    } else if (_userHasPressedTheSwitch){ // switch on to radians
        
        if ([_TanKey.titleLabel.text isEqualToString:@"arctan\u207B\u00B9"]) { // if button is sin -1
            operation = @"arctan\u207B\u00B9"; // arc sin radians
        } else {
            operation = @"tanr"; // sin radians
        }
    }
    
    [self.brain getOperand:[self.display.text doubleValue]];
    tanoper = [self.brain performCalculation:operation];
    [_display setText:[NSString stringWithFormat:@"%g", tanoper]];
    
}





- (IBAction)log:(id)sender {
    
    double oper = 0.0;
    
    NSString *operation = [sender currentTitle];
    if ([operation isEqualToString:@"log\u2081\u2080"]) {
        operation = @"log\u2081\u2080";
    }
    
    else if ([operation isEqualToString:@"ln"]) {
        operation = @"ln";
    }
    

  
    
    [self .brain getOperand:[self.display.text doubleValue]];
    oper = [self.brain performCalculation:operation];
    [_display setText:[NSString stringWithFormat:@"%g", oper]];
}
- (IBAction)performPi:(id)sender {
    
    
    self.display.text = [NSString stringWithFormat:@"%0.8f", M_PI ];
        self.userIsInTheMiddleOfEnteringANumber = YES;
    
}

- (IBAction)switchFormat:(id)sender {
    if (_switchRadiantoDegrees.on) {
        _labelDisplaySwitchValue.text = @"Degrees";
        self.userHasPressedTheSwitch = NO;
        
        
    }
    else {
        _labelDisplaySwitchValue.text = @"Radian";
        self.userHasPressedTheSwitch = YES;
        


    }
    
}


- (IBAction)squareNumber:(id)sender {
    double power = 0.0;
    
    NSString *operation = [sender currentTitle];
    if ([operation isEqualToString:@"x²"]) {
        operation = @"x²";
    }
    
    
    
    [self .brain getOperand:[self.display.text doubleValue]];
    power = [self.brain performCalculation:operation];
    [_display setText:[NSString stringWithFormat:@"%g", power]];
}
- (IBAction)cubeNumber:(id)sender {
    double power = 0.0;
    
    NSString *operation = [sender currentTitle];
    if ([operation isEqualToString:@"x\u00B3"]) {
        operation = @"x\u00B3";
    }
    
    
    
    [self .brain getOperand:[self.display.text doubleValue]];
    power = [self.brain performCalculation:operation];
    [_display setText:[NSString stringWithFormat:@"%g", power]];
}

- (IBAction)sqrRoot:(id)sender {
    double sqrroot = 0.0;
    
    NSString *operation = [sender currentTitle];
    if ([operation isEqualToString:@"√x"]) {
        operation = @"√x";
    }
    
    
    
    
    
    [self .brain getOperand:[self.display.text doubleValue]];
    sqrroot = [self.brain performCalculation:operation];
    [_display setText:[NSString stringWithFormat:@"%g", sqrroot]];
}

- (IBAction)reciprocal:(id)sender {
    double recip = 0.0;
    
    NSString *operation = [sender currentTitle];
    if ([operation isEqualToString:@"1/x"]) {
        operation = @"1/x";
    }
    
    
    
    [self .brain getOperand:[self.display.text doubleValue]];
    recip = [self.brain performCalculation:operation];
    if ([operation isEqualToString:@"1/x"]&& [_display.text doubleValue] == 0.0){
        [_display setText:@"Error"];
    }
    else {
         [_display setText:[NSString stringWithFormat:@"%g", recip]];
    }
   
}

- (IBAction)percentage:(id)sender {
    double percent = 0.0;
    
    NSString *operation = [sender currentTitle];
    if ([operation isEqualToString:@"%"]) {
        operation = @"%";
    }
    
    
    
    
    
    [self .brain getOperand:[self.display.text doubleValue]];
    percent = [self.brain performCalculation:operation];
    [_display setText:[NSString stringWithFormat:@"%g", percent]];
}

-(IBAction)SecondKey:(id)sender{
    NSString *arcsin = @"arcsin\u207B\u00B9";
    NSString *arccos = @"arccos\u207B\u00B9";
    NSString *arctan = @"arctan\u207B\u00B9";

    if ([_SineKey.titleLabel.text isEqualToString:@"sin"]){
        [_SineKey setTitle:arcsin forState:UIControlStateNormal];
    }
        else {
        [_SineKey setTitle:@"sin" forState:UIControlStateNormal];
    }
        
    
    
    if ([_CosKey.titleLabel.text isEqualToString:@"cos"]){
        [_CosKey setTitle:arccos forState:UIControlStateNormal];
    }
        else {
        [_CosKey setTitle:@"cos" forState:UIControlStateNormal];
    }
    
    
    if ([_TanKey.titleLabel.text isEqualToString:@"tan"]){
        [_TanKey setTitle:arctan forState:UIControlStateNormal];
    }
    else {
        [_TanKey setTitle:@"tan" forState:UIControlStateNormal];
    }
  
    

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"tapeViewControllerPortrait"]) {
        
        ViewController *switchViewcontroller = segue.destinationViewController;
        switchViewcontroller.resultText = [_brain Equationloop];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
