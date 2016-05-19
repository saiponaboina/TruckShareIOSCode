//
//  TruckSizeViewController.m
//  TruckShare
//
//  Created by Apple on 19/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import "TruckSizeViewController.h"

@interface TruckSizeViewController ()

@end

@implementation TruckSizeViewController

- (void)viewDidLoad
{
    txtTruckDimension.layer.masksToBounds = YES;
    txtTruckDimension.layer.borderWidth = 1.0;
    txtTruckDimension.layer.cornerRadius = 5.0;
    txtTruckDimension.layer.borderColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0].CGColor;
    
    [self prefersStatusBarHidden];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return true;
}



















#pragma mark ====ACTIONS====
- (IBAction)btnBack:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:true];
}

- (IBAction)btnPrevious:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:true];
}


- (IBAction)btnNext:(UIButton *)sender
{
    UIViewController *vwContrller = [self.storyboard instantiateViewControllerWithIdentifier:@"storyIdTruckSizeController"];
    [self.navigationController pushViewController:vwContrller animated:true];
}

@end
