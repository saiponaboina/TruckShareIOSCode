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
    UITapGestureRecognizer *hideKeyboard = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:hideKeyboard];
    
    [self prefersStatusBarHidden];
    [self defaultProperties];
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



















#pragma mark ====DELEGATE METHODS====
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    [self performSelector:@selector(enablDisableNextbutton) withObject:nil afterDelay:0.1];
   
    return true;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [self performSelector:@selector(enablDisableNextbutton) withObject:nil afterDelay:0.1];
    
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
    UIViewController *vwContrller = [self.storyboard instantiateViewControllerWithIdentifier:@"storyIdThankyouController"];
    [self.navigationController pushViewController:vwContrller animated:true];
}



















#pragma mark ====USER DEFINE METHODS====
- (void)enablDisableNextbutton
{
    if ([self isMandatoryFieldEmpty])
    {
        [btnNextOutlet setEnabled:FALSE];
    }
    else
    {
        [btnNextOutlet setEnabled:TRUE];
    }
}


- (BOOL)isMandatoryFieldEmpty
{
    BOOL conditionPass = NO;
    
    if (txtTruckDimension.text.length==0 ||
        txtTruckType.text.length==0)
    {
        conditionPass = YES;
    }
    
    return conditionPass;
}


- (void) defaultProperties
{
    txtTruckDimension.layer.masksToBounds = YES;
    txtTruckDimension.layer.borderWidth = 1.0;
    txtTruckDimension.layer.cornerRadius = 5.0;
    txtTruckDimension.layer.borderColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0].CGColor;
    
    txtTruckType.layer.masksToBounds = YES;
    txtTruckType.layer.borderWidth = 1.0;
    txtTruckType.layer.cornerRadius = 5.0;
    txtTruckType.layer.borderColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0].CGColor;
    
    btnTruckType.layer.masksToBounds = YES;
    btnTruckType.layer.borderWidth = 1.0;
    btnTruckType.layer.cornerRadius = 5.0;
    btnTruckType.layer.borderColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0].CGColor;
}


- (void)hideKeyboard
{
    [txtTruckDimension resignFirstResponder];
    [txtTruckType resignFirstResponder];
}



@end
