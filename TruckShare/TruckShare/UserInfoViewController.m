//
//  UserInfoViewController.m
//  TruckShare
//
//  Created by Apple on 13/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import "UserInfoViewController.h"
#import "PaymentInfoViewController.h"
#import "configuration.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"

@interface UserInfoViewController ()
{
    AppDelegate *appDelegate;
}
@end

@implementation UserInfoViewController

- (void)viewDidLoad
{
    appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    scrPersonal.contentSize = CGSizeMake(scrPersonal.contentSize.width, scrPersonal.frame.size.height);

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



















#pragma mark =======DELEGATE METHOD=========
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect scrollFrame = scrPersonal.frame;
    scrollFrame.size.height = [UIScreen mainScreen].bounds.size.height-76-216-20;
    scrPersonal.frame = scrollFrame;
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect scrollFrame = scrPersonal.frame;
    scrollFrame.size.height = [UIScreen mainScreen].bounds.size.height-76;
    scrPersonal.frame = scrollFrame;
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    [self performSelector:@selector(enablDisableNextbutton) withObject:nil afterDelay:0.1];
    
    if(textField == txtFirstName || textField == txtSecondName)
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
    else if (textField == txtMobile)
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
    if (txtMobile.text.length!=10)
    {
        [self showAlert:@"Mobile number should contain 10 digits."];
        return;
        
    }
    else if (![self validateEmail:txtEmail.text])
    {
        [self showAlert:@"Invalid email id."];
        return;
    }
    else if (![txtPassword.text isEqualToString:txtConfirmPassword.text])
    {
        [self showAlert:@"Password not matched."];
        return;
    }
    else
    {
        [self checkEmailAddressUsed];
    }
}


- (IBAction)btnBack:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:true];
}





















#pragma mark =======USER DEFINE METHODS=========
- (void)defaultProperties
{
    for (int i=401; i<=406; i++)
    {
        UITextField *txtTemp = (UITextField *)[scrPersonal viewWithTag:i];
        
        txtTemp.layer.masksToBounds = YES;
        txtTemp.layer.borderWidth = 1.0;
        txtTemp.layer.cornerRadius = 5.0;
        txtTemp.layer.borderColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0].CGColor;
    }
}


- (BOOL)checkValidation
{
    if (txtEmail.text.length==0 ||
        txtFirstName.text.length==0 ||
        txtSecondName.text.length==0 ||
        txtPassword.text.length==0 ||
        txtMobile.text.length==0)
    {
        return NO;
    }
    
    return YES;
}


- (BOOL)isMandatoryFieldEmpty
{
    BOOL conditionPass = NO;

    if (txtEmail.text.length==0 ||
        txtFirstName.text.length==0 ||
        txtSecondName.text.length==0 ||
        txtPassword.text.length==0 ||
        txtMobile.text.length==0)
    {
        conditionPass = YES;
    }
    
    return conditionPass;
}
    
    
- (BOOL) validateEmail: (NSString *) email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


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


- (void)showAlert :(NSString *)strMessage
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Truck Share" message:strMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:alertAction];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}


- (void)checkEmailAddressUsed
{
    NSString *strUrl = [NSString stringWithFormat:@"%@appUser/IsEmailAlreadyExist",kBaseUrl];
    NSDictionary *dictPara = @{@"eMailId":txtEmail.text};
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.responseSerializer =  [AFJSONResponseSerializer serializer];

    [MBProgressHUD showHUDAddedTo:self.view animated:true];
    [manager GET:strUrl parameters:dictPara progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [MBProgressHUD hideAllHUDsForView:self.view animated:true];
        NSDictionary *dictResult = responseObject;
        NSNumber *emailExist = dictResult[@"result"];
        
        if ([emailExist boolValue])
        {
            [appDelegate showAlert:@"Email Address is already exist" viewController:self];
        }
        else
        {
            NSMutableDictionary *dictUserInfo = [[NSMutableDictionary alloc] init];

            [dictUserInfo setObject:@"Internal" forKey:kAuthenticationSource];
            [dictUserInfo setObject:txtFirstName.text forKey:kFirstName];
            [dictUserInfo setObject:txtSecondName.text forKey:kLastName];
            [dictUserInfo setObject:txtEmail.text forKey:kEmailAddress];
            [dictUserInfo setObject:txtPassword.text forKey:kPassword];
            [dictUserInfo setObject:txtMobile.text forKey:kMobileNumber];
            
            NSDictionary *dictTemp = @{@"userInfo":dictUserInfo};

            PaymentInfoViewController *paymentController = [self.storyboard instantiateViewControllerWithIdentifier:@"storyIdPaymentInfoController"];
            paymentController.dictRegisDetails = (NSMutableDictionary *)dictTemp;
            [self.navigationController pushViewController:paymentController animated:true];

        }
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        [MBProgressHUD hideAllHUDsForView:self.view animated:true];
        NSLog(@"Error: %@",error);
    }];
}


@end
