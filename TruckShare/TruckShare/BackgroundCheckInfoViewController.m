//
//  BackgroundCheckInfoViewController.m
//  TruckShare
//
//  Created by Apple on 16/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import "BackgroundCheckInfoViewController.h"
#import "DriverLicenseViewController.h"
#import "configuration.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"

@interface BackgroundCheckInfoViewController ()

@end

@implementation BackgroundCheckInfoViewController
@synthesize dictRegisDetails;

- (void)viewDidLoad
{
    dictRegisDetailsTemp = [[NSMutableDictionary alloc] initWithDictionary:dictRegisDetails];

    [self defaultProperties];
    [self prefersStatusBarHidden];
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated
{
//    NSLog(@"dict: %@",dictRegisDetails);
}


- (BOOL)prefersStatusBarHidden
{
    return true;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



















#pragma mark ==DELEGATE METHODS==
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField==txtSocialSecurityNumber)
    {
        NSCharacterSet *validCharSet = [[[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet] invertedSet];
        
        if ([string isEqualToString:@""])
        {
            return YES;
        }
        
        if([string rangeOfCharacterFromSet:validCharSet].location != NSNotFound)
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }
    else
    {
        return YES;
    }
    
    return YES;
}



















#pragma mark ====ACTIONS====
- (IBAction)btnShowSSN:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if (sender.selected)
    {
        txtSocialSecurityNumber.secureTextEntry = false;
        sender.backgroundColor =  [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0];
    }
    else
    {
        txtSocialSecurityNumber.secureTextEntry = true;
        sender.backgroundColor = [UIColor clearColor];
    }
}


- (IBAction)btnSelectAgreement:(UIButton *)sender
{
    sender.selected = !sender.selected;
    [btnNext setEnabled:sender.selected];
    
    if (sender.selected)
    {
        [sender setBackgroundColor:[UIColor redColor]];
    }
    else
    {
        [sender setBackgroundColor:[UIColor clearColor]];
    }
}


- (IBAction)btnNext: (UIButton *)sender
{
    NSDictionary *dictTemp = @{kSsnNumber: txtSocialSecurityNumber.text};
    [dictRegisDetailsTemp setObject:dictTemp forKey:@"BackgroundCheckInfo"];
    
     DriverLicenseViewController *vwContrller = [self.storyboard instantiateViewControllerWithIdentifier:@"storyidDriverLicenseController"];
    vwContrller.dictRegisDetails = dictRegisDetailsTemp;
    [self.navigationController pushViewController:vwContrller animated:true];
}


- (IBAction)btnPrevious:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:true];
}


- (IBAction)btnBack:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:true];
}




















#pragma mark ====USER DEFINE METHODS====
- (void) defaultProperties
{
    btnCheckedOutlet.layer.masksToBounds = YES;
    btnCheckedOutlet.layer.borderColor = [UIColor blackColor].CGColor;
    btnCheckedOutlet.layer.borderWidth = 1.0;
    btnCheckedOutlet.selected = NO;
    
    btnSSNOutlet.layer.masksToBounds = YES;
    btnSSNOutlet.layer.borderColor = [UIColor blackColor].CGColor;
    btnSSNOutlet.layer.borderWidth = 1.0;
    btnSSNOutlet.selected = NO;
}

@end
