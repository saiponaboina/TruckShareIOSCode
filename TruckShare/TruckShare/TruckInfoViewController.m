//
//  TruckInfoViewController.m
//  TruckShare
//
//  Created by Apple on 18/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import "TruckInfoViewController.h"
#import "InsuranceViewController.h"
#import "configuration.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"

@interface TruckInfoViewController ()

@end

@implementation TruckInfoViewController
@synthesize arrState;
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



















#pragma mark ====DELEGATE METHODS====
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [self performSelector:@selector(enablDisableNextbutton) withObject:nil afterDelay:0.1];

    if  (textField == txtVinNumber || textField==txtRegNumber)
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


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    imgDocPic.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self enablDisableNextbutton];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return arrState.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *strStateName = [[arrState objectAtIndex:row] objectForKey:@"stateName"];
    return strStateName;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    strState = [[arrState objectAtIndex:row] objectForKey:@"stateName"];
    strStateId = [[arrState objectAtIndex:row] objectForKey:@"stateId"];
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


- (IBAction)btnNext: (UIButton *)sender
{
    NSData *profilePicData = UIImagePNGRepresentation(imgDocPic.image);
    NSString *strEncodedImage = [profilePicData base64EncodedStringWithOptions:0];
    
    NSDictionary *dictTemp = @{kTruckRegistrationNumber: txtRegNumber.text,
                               kTruckVinNumber: txtVinNumber.text,
                               kTruckRegisteredStateId: strStateId,
                               kTruckTitleDocImageBase64String: strEncodedImage,
                               kTruckTitleDocImageFormat: @"png"};
    [dictRegisDetailsTemp setObject:dictTemp forKey:@"truckInfo"];

    InsuranceViewController *vwContrller = [self.storyboard instantiateViewControllerWithIdentifier:@"storyidInsuranceController"];
    vwContrller.dictRegisDetails = dictRegisDetailsTemp;
    [self.navigationController pushViewController:vwContrller animated:true];
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


- (IBAction)btnShowStateList:(UIButton *)sender
{
    [txtRegNumber resignFirstResponder];
    [txtVinNumber resignFirstResponder];

    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect stateFrame = vwStateList.frame;
        stateFrame.origin.y = [UIScreen mainScreen].bounds.size.height-stateFrame.size.height;
        vwStateList.frame = stateFrame;
    }];
}


- (IBAction)btnCancel:(UIButton *)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect stateFrame = vwStateList.frame;
        stateFrame.origin.y = [UIScreen mainScreen].bounds.size.height;
        vwStateList.frame = stateFrame;
    }];
}


- (IBAction)btnDone:(UIButton *)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect stateFrame = vwStateList.frame;
        stateFrame.origin.y = [UIScreen mainScreen].bounds.size.height;
        vwStateList.frame = stateFrame;
    } completion:^(BOOL finished) {
        
        [btnStateSelect setTitle:strState forState:UIControlStateNormal];
        [self enablDisableNextbutton];
    }];
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
    
    if (txtRegNumber.text.length==0 ||
        txtVinNumber.text.length==0 ||
        btnStateSelect.titleLabel.text.length==0 ||
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
    
    btnStateSelect.layer.masksToBounds = YES;
    btnStateSelect.layer.borderWidth = 1.0;
    btnStateSelect.layer.cornerRadius = 5.0;
    btnStateSelect.layer.borderColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0].CGColor;
    
}



@end
