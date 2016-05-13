//
//  PaymentInfoViewController.m
//  TruckShare
//
//  Created by Apple on 13/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import "PaymentInfoViewController.h"

@interface PaymentInfoViewController ()

@end

@implementation PaymentInfoViewController

- (void)viewDidLoad
{
    scrCreditCard.contentSize = CGSizeMake(scrCreditCard.frame.size.width, scrCreditCard.frame.size.height);
    scrBankInformation.contentSize = CGSizeMake(scrBankInformation.frame.size.width, scrBankInformation.frame.size.height);
    
    [super viewDidLoad];
    [self prefersStatusBarHidden];
    [self defaultProperties];
}


- (BOOL)prefersStatusBarHidden
{
    return true;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



















#pragma mark ==DELEGATE METHODS==
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (!scrCreditCard.isHidden)
    {
        CGRect scrollFrame = scrCreditCard.frame;
        scrollFrame.size.height = [UIScreen mainScreen].bounds.size.height-76-216-20;
        scrCreditCard.frame = scrollFrame;
    }
    else
    {
        CGRect scrollFrame = scrBankInformation.frame;
        scrollFrame.size.height = [UIScreen mainScreen].bounds.size.height-76-216-20;
        scrBankInformation.frame = scrollFrame;
    }
}



- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (!scrCreditCard.isHidden)
    {
        CGRect scrollFrame = scrCreditCard.frame;
        scrollFrame.size.height = [UIScreen mainScreen].bounds.size.height-76;
        scrCreditCard.frame = scrollFrame;
    }
    else
    {
        CGRect scrollFrame = scrBankInformation.frame;
        scrollFrame.size.height = [UIScreen mainScreen].bounds.size.height-76;
        scrBankInformation.frame = scrollFrame;
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [self performSelector:@selector(enablDisableNextbutton) withObject:nil afterDelay:0.1];
    if  (textField == txtCardNumber || textField == txtCvvCode || textField == txtPincode)
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
}




















#pragma mark =======ACTIONS=========

- (IBAction)btnNext: (UIButton *)sender
{
}

- (IBAction)btnBack:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:true];
}


- (IBAction)btnSelectYesNo:(UIButton *)sender
{
    vwAreYouDriver.hidden = true;
    
    if (sender.tag == 101)
    {
        lblHeader.text = @"Bank Information";
        //showBankInfoScreen = YES;
         scrCreditCard.hidden = true;
         scrBankInformation.hidden = false;
    }
    else
    {
        lblHeader.text = @"Credit Card";
        //   showBankInfoScreen = NO;
         scrCreditCard.hidden = false;
         scrBankInformation.hidden = true;
    }
}


- (IBAction)btnSelectCardType:(UIButton *)sender
{
    UIAlertController *cardListController = [UIAlertController alertControllerWithTitle:@"Card Type" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *visaAction = [UIAlertAction actionWithTitle:@"Visa" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        
        [btnCreditCard setTitle:@"Visa" forState:UIControlStateNormal];
        [self dismissViewControllerAnimated:true completion:nil];
        
    }];
    
    UIAlertAction *mastercardAction = [UIAlertAction actionWithTitle:@"MasterCard" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        
        [btnCreditCard setTitle:@"MasterCard" forState:UIControlStateNormal];
        [self dismissViewControllerAnimated:true completion:nil];
        
    }];
    
    UIAlertAction *discovervisaAction = [UIAlertAction actionWithTitle:@"Discover" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        
        [btnCreditCard setTitle:@"Discover" forState:UIControlStateNormal];
        [self dismissViewControllerAnimated:true completion:nil];
        
    }];
    
    UIAlertAction *americanexpressAction = [UIAlertAction actionWithTitle:@"American Express" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        
        [btnCreditCard setTitle:@"American Express" forState:UIControlStateNormal];
        [self dismissViewControllerAnimated:true completion:nil];
    }];
    
    [cardListController addAction:visaAction];
    [cardListController addAction:mastercardAction];
    [cardListController addAction:discovervisaAction];
    [cardListController addAction:americanexpressAction];
    
    [self presentViewController:cardListController animated:true completion:nil];
}


- (IBAction)btnSelectPaymentMethod:(UIButton *)sender
{
    if (sender.tag == 901)
    {
        btnRadioChecking.backgroundColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0];
        btnSavingChecking.backgroundColor = [UIColor whiteColor];
    }
    else
    {
        btnSavingChecking.backgroundColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0];
        btnRadioChecking.backgroundColor = [UIColor whiteColor];
    }
}


- (IBAction)btnPrevious:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:true];
}



















#pragma mark=========USER DEFINE METHODS===========
- (void)defaultProperties
{
    btnCreditCard.layer.masksToBounds = true;
    btnCreditCard.layer.borderWidth = 1.0;
    btnCreditCard.layer.cornerRadius = 5.0;
    btnCreditCard.layer.borderColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0].CGColor;
    
    btnRadioChecking.layer.masksToBounds = true;
    btnRadioChecking.layer.cornerRadius = 8.0;
    btnRadioChecking.layer.borderColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0].CGColor;
    btnRadioChecking.layer.borderWidth = 1.0;
    
    
    btnSavingChecking.layer.masksToBounds = true;
    btnSavingChecking.layer.cornerRadius = 8.0;
    btnSavingChecking.layer.borderColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0].CGColor;
    btnSavingChecking.layer.borderWidth = 1.0;
    
    for (int i=401; i<=405; i++)
    {
        UITextField *txtTemp = (UITextField *)[scrCreditCard viewWithTag:i];
        
        txtTemp.layer.masksToBounds = YES;
        txtTemp.layer.borderWidth = 1.0;
        txtTemp.layer.cornerRadius = 5.0;
        txtTemp.layer.borderColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0].CGColor;
    }
}


- (void)enablDisableNextbutton
{
   /* if ([self isMandatoryFieldEmpty])
    {
        [btnNextOutlet setEnabled:FALSE];
    }
    else
    {
        [btnNextOutlet setEnabled:TRUE];
    }*/
}




@end
