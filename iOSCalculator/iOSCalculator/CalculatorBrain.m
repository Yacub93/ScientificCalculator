//
//  CalculatorBrain.m
//  iOSCalculator
//
//  Created by Yacub Ali on 06/02/2015.
//  Copyright (c) 2015 Yacub Ali. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@end

@implementation CalculatorBrain
@synthesize operand = _operand;
@synthesize finalcalc = _finalcalc;

-(NSMutableArray *) operand
{
    if (!_operand) {
        _operand = [[NSMutableArray alloc] init];
    }
    return _operand;
}

-(NSMutableArray *) finalcalc// Array to store calculations
{
    if (!_finalcalc) {
        _finalcalc = [[NSMutableArray alloc] init];
    }
    return _finalcalc;
}

-(void)clearMemory{
    [self.operand removeAllObjects];//remove content within operand
}

-(void)getOperand:(double)operand
{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operand addObject:operandObject];
}
-(double)setOperand
{
    NSNumber *operandEntry = [self.operand lastObject];
    if (operandEntry) {
        [self.operand removeLastObject];
    }
    return [operandEntry doubleValue];
}

-(double)performCalculation:(NSString *)operation
{
    double result = 0;
    double NumberOne = [self setOperand];//store first value
    double NumberTwo = [self setOperand];//store second value
    
    NSNumber *convertnumberone = [NSNumber numberWithDouble:NumberOne];//double numberOne to NSNumber
    NSNumber *convertnumbertwo = [NSNumber numberWithDouble:NumberTwo];//double numberOne to NSNumber
    
    NSString *FirstPart = [[convertnumberone stringValue]stringByAppendingString:operation];
    NSString *SecondPart = [FirstPart stringByAppendingString:[convertnumbertwo stringValue]];
    NSString *ThirdPart = [SecondPart stringByAppendingString:@"="];
    
    if ([operation isEqualToString:@"+"]) {
        result = NumberOne + NumberTwo;
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
    }
    else if([operation isEqualToString:@"-"]){
        double subtrahend = NumberOne;
        result = NumberTwo - subtrahend;
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
    }
    else if([operation isEqualToString:@"x"]){
        result = NumberOne * NumberTwo;
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
    }
    else if([operation isEqualToString:@"/"]){
        double divisor = NumberOne;
        result = NumberTwo / divisor;
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
    }
    else if([operation isEqualToString:@"sind"]){
        
        result = sin ((NumberOne * M_PI) / 180);
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
    }
    else if([operation isEqualToString:@"sinr"]){
        
        result = sin (NumberOne);
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
    }
    else if([operation isEqualToString:@"cosd"]){
        
        result = cos ((NumberOne * M_PI) / 180);
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
    }
    else if([operation isEqualToString:@"cosr"]){
        
        result = cos (NumberOne);
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
    }
    else if([operation isEqualToString:@"tand"]){
        
        result = tan ((NumberOne * M_PI) / 180);
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
    }
    else if([operation isEqualToString:@"tanr"]){
        
        result = tan (NumberOne);
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
    }
    else if([operation isEqualToString:@"log\u2081\u2080"]){
        
        result = log10 (NumberOne);
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
    }
    else if([operation isEqualToString:@"ln"]){
        
        result = log(NumberOne);
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
    }
    else if([operation isEqualToString:@"x²"]){
        
        result = pow(NumberOne, 2);
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
    }
    else if([operation isEqualToString:@"x\u00B3"]){
        
        result = pow(NumberOne, 3);
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
    }
    else if([operation isEqualToString:@"√x"]){
        
        result = sqrt(NumberOne);
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
        
    }
    else if([operation isEqualToString:@"1/x"]){
        
        result = 1 / (NumberOne);
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
    }
    
    else if([operation isEqualToString:@"%"]){
        
        result =  (NumberOne) / 100.0f;
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
    }
    
    
    
    
    
    else if([operation isEqualToString:@"sin\u207B\u00B9"]){
        
        result = asin (NumberOne) * 180 / M_PI;//degrees arcsine
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
        
        
    }
    else if([operation isEqualToString:@"arcsin\u207B\u00B9"]){
        
        result = asin (NumberOne);//radians arcsine
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
        
    }
    
    else if([operation isEqualToString:@"cos\u207B\u00B9"]){
        
        result = acos (NumberOne) * 180 / M_PI;//degrees arcsine
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
        
        
    }
    else if([operation isEqualToString:@"arccos\u207B\u00B9"]){
        
        result = acos (NumberOne);//radians arcsine
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
        
    }
  
    
    else if([operation isEqualToString:@"tan\u207B\u00B9"]){
        
        result = atan (NumberOne) * 180 / M_PI;//degrees arcsine
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
        
    }
    else if([operation isEqualToString:@"arctan\u207B\u00B9"]){
        
        result = atan (NumberOne);//radians arcsine
        
        NSNumber *finalresult = [NSNumber numberWithDouble:result];
        NSString *finalequation = [ThirdPart stringByAppendingString:[finalresult stringValue]];
        [self.finalcalc addObject:finalequation];
        
    }
    
    
    

    [self getOperand:result];
    return result;
    
 
}

- (NSString *) Equationloop{
    NSMutableString *CompleteEquation = [[NSMutableString alloc]init];
    
    for (NSString *calculate in  _finalcalc) {//loop through array of calculations
        [CompleteEquation appendFormat:@"\n%@", calculate];//display each calculation on new line
    }
    return CompleteEquation;//return complete calculation
}







@end

