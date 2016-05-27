//
//  InsuranceViewController.m
//  TruckShare
//
//  Created by Apple on 19/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import "InsuranceViewController.h"
#import "SelectTruckViewController.h"
#import "configuration.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"

@interface InsuranceViewController ()
{
    AppDelegate *appDelegate;
}
@end

@implementation InsuranceViewController
@synthesize dictRegisDetails;

- (void)viewDidLoad
{
    appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    dictRegisDetailsTemp = [[NSMutableDictionary alloc] initWithDictionary:dictRegisDetails];

    [self defaultProperties];
    [self prefersStatusBarHidden];
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated
{
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



















#pragma mark ====DELEGATE METHODS====
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [self performSelector:@selector(enablDisableNextbutton) withObject:nil afterDelay:0.1];

    if  (textField == txtPolicyNumber)
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
    else if  (textField == txtDateOfExpiry)
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


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    imgDocPic.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self enablDisableNextbutton];
}





















#pragma mark ====ACTIONS====
- (IBAction)btnBack:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:true];
}


- (IBAction)btnNext: (UIButton *)sender
{
    if ([appDelegate isTheStringDate:txtDateOfExpiry.text dateFormat:@"MM/dd/yyyy"])
    {
        NSData *profilePicData = UIImagePNGRepresentation(imgDocPic.image);
        NSString *strEncodedImage = [profilePicData base64EncodedStringWithOptions:0];
        
        NSDictionary *dictTemp = @{kInsuranceProvider: txtInsurProvider.text,
                                   kPolicyNumber: txtPolicyNumber.text,
                                   kDateOfExpiry: txtDateOfExpiry,
                                   kInsuranceDocImageBase64String: strEncodedImage,
                                   kInsuranceDocImageFormat: @"png"};
        [dictRegisDetailsTemp setObject:dictTemp forKey:@"insuranceInfo"];
        
        SelectTruckViewController *vwContrller = [self.storyboard instantiateViewControllerWithIdentifier:@"storyIdSelectTruckController"];
        vwContrller.dictRegisDetails = dictRegisDetailsTemp;
        [self.navigationController pushViewController:vwContrller animated:true];
    }
    else
    {
        [appDelegate showAlert:@"Invalid date." viewController:self];
    }
}

- (IBAction)btnPrevious:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:true];
}


- (IBAction)btnCapture:(UIButton *)sender
{
    UIAlertController *actionsheet = [UIAlertController alertControllerWithTitle:@"Truck Share" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    
    imgPicker.delegate = self;
    
    UIAlertAction *galleryAction = [UIAlertAction actionWithTitle:@"Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imgPicker animated:YES completion:nil];
    }];
    
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imgPicker animated:YES completion:nil];
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [actionsheet addAction:galleryAction];
    [actionsheet addAction:cameraAction];
    [actionsheet addAction:cancelAction];
    
    [self presentViewController:actionsheet animated:YES completion:nil];
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
    
    if (txtInsurProvider.text.length==0 ||
        txtPolicyNumber.text.length==0 ||
        txtDateOfExpiry.text.length==0 ||
        imgDocPic.image==nil)
    {
        conditionPass = YES;
    }
    
    return conditionPass;
}


- (void) defaultProperties
{
    for (int i=401; i<=403; i++)
    {
        UITextField *txtTemp = (UITextField *)[self.view viewWithTag:i];
        
        txtTemp.layer.masksToBounds = YES;
        txtTemp.layer.borderWidth = 1.0;
        txtTemp.layer.cornerRadius = 5.0;
        txtTemp.layer.borderColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0].CGColor;
    }
    
    imgDocPic.layer.masksToBounds = YES;
    imgDocPic.layer.borderWidth = 1.0;
    imgDocPic.layer.cornerRadius = 5.0;
    imgDocPic.layer.borderColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0].CGColor;
    
    
}


@end
