//
//  TapeViewController.m
//  iOSCalculator
//
//  Created by Yacub Ali on 25/02/2015.
//  Copyright (c) 2015 Yacub Ali. All rights reserved.
//

#import "TapeViewController.h"

@interface TapeViewController ()
@property (strong, nonatomic)NSString *resultText;
@end

@implementation TapeViewController

@synthesize TextviewResult = _TextviewResult;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _TextviewResult.text = self.resultText;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
