//
//  ViewController.m
//  RXRollInfoView
//
//  Created by wwx on 15/9/29.
//  Copyright © 2015年 shadow. All rights reserved.
//

#import "ViewController.h"
#import "RXRollInfoView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *temArr = [NSArray arrayWithObjects:
                       @"this is 1st log",
                       @"this is 2nd log",
                       @"this is 3rd log",
                       @"this is 4th log",
                       @"this is 5th log",
                       @"this is 6th log",
                       @"this is 7th log",
                       @"this is 8th log",
                       @"this is 9th log",nil];
//    NSArray *temArr = [NSArray array];
    
    RXRollInfoView *rxView = [[RXRollInfoView alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 40)];
    [self.view addSubview:rxView];
    [rxView setInfoStringsArray:temArr andRollDuration:3];
//    rxView.RollDirection = 0;
   
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
