//
//  ForgotPasswordViewController.m
//  TruckShare
//
//  Created by Indrajeet on 04/01/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prefersStatusBarHidden];
}


- (void)viewWillAppear:(BOOL)animated
{
    [txtSignId becomeFirstResponder];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}














#pragma mark ==ACTIONS==
- (IBAction)btnSend:(UIButton *)sender
{
    if (txtSignId.text.length == 0)
    {
        [self showAlert:@"Sign Id is mandatory."];
    }
}


- (IBAction)btnBack:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}















#pragma mark ==USER DEFINE METHODS==
- (void)showAlert :(NSString *)strMessage
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Truck Share" message:strMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:alertAction];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}


@end
