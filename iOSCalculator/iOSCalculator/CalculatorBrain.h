//
//  CalculatorBrain.h
//  iOSCalculator
//
//  Created by Yacub Ali on 06/02/2015.
//  Copyright (c) 2015 Yacub Ali. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
-(void)getOperand:(double)operand;
-(double)performCalculation:(NSString *)operation;
-(void)clearMemory;
@property (nonatomic, strong) NSMutableArray *operand;
@property (nonatomic, strong) NSMutableArray *finalcalc;

- (NSString *) Equationloop;

@end
