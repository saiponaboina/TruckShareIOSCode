//
//  PaymentInfoViewController.m
//  TruckShare
//
//  Created by Apple on 13/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import "PaymentInfoViewController.h"
#import "ProfilePictureViewController.h"
#import "configuration.h"
#import "Luhn.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"


@interface PaymentInfoViewController ()
{
    AppDelegate *appDelegate;
}

@end

@implementation PaymentInfoViewController
@synthesize  dictRegisDetails;

- (void)viewDidLoad
{
    appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    scrCreditCard.contentSize = CGSizeMake(scrCreditCard.frame.size.width, scrCreditCard.frame.size.height);
    scrBankInformation.contentSize = CGSizeMake(scrBankInformation.frame.size.width, scrBankInformation.frame.size.height);
    dictRegisDetailsTemp = [[NSMutableDictionary alloc] initWithDictionary:dictRegisDetails];
    selectedAccountType = @"Checking";
    
    [super viewDidLoad];
    [self prefersStatusBarHidden];
    [self defaultProperties];
}


- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"dict Details: %@",dictRegisDetails);
    isCreditCardValid = false;
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
    
    if (textField == txtCardNumber)
    {
        BOOL isValid = [Luhn validateString:textField.text];
        
        if (isValid)
        {
            isCreditCardValid = true;
        }
        else
        {
            isCreditCardValid = false;
            [self showAlert:@"Invalid credit card number"];
        }
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [self performSelector:@selector(enablDisableNextbutton) withObject:nil afterDelay:0.1];
    
    if  (textField == txtCardNumber || textField == txtCvvCode || textField == txtPincode || textField == txtBankAcNumber || textField == txtConfirmAcNumber || textField == txtBankRoutNumber)
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
    else if (textField == txtAccountName)
    {
        NSCharacterSet *validCharSet = [[[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"] invertedSet] invertedSet];
        
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
    else if (textField == txtCardExpiry)
    {
        NSCharacterSet *validCharSet = [[[NSCharacterSet characterSetWithCharactersInString:@"0123456789/"] invertedSet] invertedSet];
        
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
    if (!scrCreditCard.isHidden)
    {
        if ([appDelegate isTheStringDate:txtCardExpiry.text dateFormat:@"MM/yy"])
        {
            [self renterRegistration];
        }
        else
        {
            [self showAlert:@"Expiry date should be in mm/yy format."];
        }
    }
    else
    {
        if ([txtBankAcNumber.text isEqualToString:txtConfirmAcNumber.text])
        {
            NSDictionary *dictTemp = @{kAccountType: selectedAccountType,
                                       kAccountHolderName: txtAccountName.text,
                                       kBankAccountNumber: txtBankAcNumber.text,
                                       kBankRoutingNumber: txtBankRoutNumber.text};
            [dictRegisDetailsTemp setObject:dictTemp forKey:@"accountInfo"];
            
            ProfilePictureViewController *paymentController = [self.storyboard instantiateViewControllerWithIdentifier:@"storyidProfilePictureController"];
            paymentController.dictRegisDetails = dictRegisDetailsTemp;
            [self.navigationController pushViewController:paymentController animated:true];
        }
        else
        {
            [self showAlert:@"Account number are not matching"];
        }
    }
    
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
        scrCreditCard.hidden = true;
        scrBankInformation.hidden = false;
        [dictRegisDetailsTemp setObject:@"D" forKey:kAppUserType];
    
    }
    else
    {
        lblHeader.text = @"Credit Card";
         scrCreditCard.hidden = false;
         scrBankInformation.hidden = true;
        [dictRegisDetailsTemp setObject:@"R" forKey:kAppUserType];
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
        selectedAccountType = @"Checking";
    }
    else
    {
        btnSavingChecking.backgroundColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0];
        btnRadioChecking.backgroundColor = [UIColor whiteColor];
        selectedAccountType = @"Savings";
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
    if ([self isMandatoryFieldEmpty])
    {
        [btnNextOutlet setEnabled:FALSE];
        [btnAccInfoNextOutlet setEnabled:FALSE];
    }
    else
    {
        [btnNextOutlet setEnabled:TRUE];
        [btnAccInfoNextOutlet setEnabled:TRUE];
    }
}


- (void)showAlert :(NSString *)strMessage
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Truck Share" message:strMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:alertAction];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}


- (BOOL)isMandatoryFieldEmpty
{
    BOOL conditionPass = NO;
    
    if (!scrCreditCard.isHidden)
    {
        if (txtCardName.text.length==0 ||
            txtCardNumber.text.length==0 ||
            txtCardExpiry.text.length==0 ||
            txtPincode.text.length==0 ||
            txtCvvCode.text.length==0)
        {
            conditionPass = YES;
        }
    }
    else
    {
        if (txtAccountName.text.length==0 ||
            txtBankRoutNumber.text.length==0 ||
            txtBankAcNumber.text.length==0 ||
            txtConfirmAcNumber.text.length==0 )
        {
            conditionPass = YES;
        }
    }
    
    return conditionPass;
}


- (void)renterRegistration
{
    NSString *strUrl = [NSString stringWithFormat:@"%@appUser/RegisterAppUser",kBaseUrl];
    NSMutableDictionary *dictTemp = [dictRegisDetailsTemp objectForKey:@"userInfo"];
    NSDictionary *dictPara = @{kAuthenticationSource: dictTemp[kAuthenticationSource],
                               kFirstName: dictTemp[kFirstName],
                               kLastName: dictTemp[kLastName],
                               kPassword: dictTemp[kPassword],
                               kEmailAddress: dictTemp[kEmailAddress],
                               kMobileNumber: dictTemp[kMobileNumber],
                               kCreditCardType: btnCreditCard.titleLabel.text,
                               kFullNameOnCard: txtCardName.text,
                               kCreditCardNumber: txtCardNumber.text,
                               kExpiration: txtCardExpiry.text,
                               kCvvCode: txtCvvCode.text,
                               kZipCode: txtPincode.text,
                               kAppUserType: dictRegisDetailsTemp[kAppUserType]};
    
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:true];
    [manager POST:strUrl parameters:dictPara progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [MBProgressHUD hideAllHUDsForView:self.view animated:true];
        
        if ([[responseObject valueForKey:@"success"] boolValue])
        {
            UIViewController *thankYouController = [self.storyboard instantiateViewControllerWithIdentifier:@"storyIdThankyouController"];
            [self.navigationController pushViewController:thankYouController animated:true];
        }
        else
        {
            [appDelegate showAlert:@"Unable to register. Try againg." viewController:self];
        }
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD hideAllHUDsForView:self.view animated:true];
        NSLog(@"Error: %@",error);
    }];

}



@end
