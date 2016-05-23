//
//  ThankYouViewController.m
//  TruckShare
//
//  Created by Apple on 23/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import "ThankYouViewController.h"

@interface ThankYouViewController ()

@end

@implementation ThankYouViewController

- (void)viewDidLoad
{
    [self prefersStatusBarHidden];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return true;
}



















#pragma mark ====ACTIONS====
- (IBAction)btnSigIn:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:true];
}

@end
