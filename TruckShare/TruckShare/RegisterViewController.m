//
//  RegisterViewController.m
//  TruckShare
//
//  Created by Indrajeet on 30/12/15.
//  Copyright © 2015 Indrajeet. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@end

@implementation RegisterViewController

- (void)viewDidLoad
{
    scrPage.contentSize = CGSizeMake(860.0, scrPage.contentSize.height);
    scrDisplay.contentSize = CGSizeMake(screenWidth*6, scrDisplay.frame.size.height);
    scrCreditCard.contentSize = CGSizeMake(318.0, scrCreditCard.frame.size.height);
    
    screenWidth = [UIScreen mainScreen].bounds.size.width;

    [self defaultProperties];
    [self prefersStatusBarHidden];
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}














#pragma mark ==DELEGATE METHODS==
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
   if (scrDisplay.contentOffset.x==screenWidth)
   {
       CGRect scrollFrame = scrCreditCard.frame;
       scrollFrame.size.height = [UIScreen mainScreen].bounds.size.height-76-216-20;
       scrCreditCard.frame = scrollFrame;
       scrDisplay.scrollEnabled = NO;
   }
}



- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (scrDisplay.contentOffset.x==screenWidth)
    {
        CGRect scrollFrame = scrCreditCard.frame;
        scrollFrame.size.height = [UIScreen mainScreen].bounds.size.height-76;
        scrCreditCard.frame = scrollFrame;
        scrDisplay.scrollEnabled = YES;
    }
}




- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView==scrDisplay)
    {
        int val = scrollView.contentOffset.x/scrDisplay.frame.size.width;
        int tagVal = val+101;
        
        UIButton *btnTemp = (UIButton *)[scrPage viewWithTag:tagVal];
        CGRect labelFrame = lblSelectorLine.frame;
        labelFrame.origin.x = btnTemp.frame.origin.x;
        labelFrame.size.width = btnTemp.frame.size.width;
        
        [UIView animateWithDuration:0.5 animations:^{
            lblSelectorLine.frame = labelFrame;
        }];
    }
    
    
    if (scrollView==scrPage)
    {
        
    }
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
    else if (textField == txtMobile || textField == txtCardNumber || textField == txtCvvCode || textField == txtPincode || textField == txtLicenseNumber || textField==txtRegNumber)
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


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    scrDisplay.contentOffset = CGPointMake(screenNumber*screenWidth, scrDisplay.contentOffset.y);
    
    if (scrDisplay.contentOffset.x == (2*screenWidth))
    {
        UIButton *btnTemp = (UIButton *)[scrDisplay viewWithTag:203];
        UIButton *btnTemp2 = (UIButton *)[scrPage viewWithTag:104];
    
        imgProfile1.image = [info objectForKey:UIImagePickerControllerOriginalImage];
        [picker dismissViewControllerAnimated:YES completion:nil];
        [btnTemp setEnabled:TRUE];
        [btnTemp2 setEnabled:TRUE];
    }
    
    if (scrDisplay.contentOffset.x == (3*screenWidth))
    {
        UIButton *btnTemp = (UIButton *)[scrDisplay viewWithTag:204];
        UIButton *btnTemp2 = (UIButton *)[scrPage viewWithTag:105];
        
        imgProfile2.image = [info objectForKey:UIImagePickerControllerOriginalImage];
        [picker dismissViewControllerAnimated:YES completion:nil];
        
        if (![self isMandatoryFieldEmpty])
        {
            [btnTemp setEnabled:TRUE];
            [btnTemp2 setEnabled:TRUE];
        }
        else
        {
            [btnTemp setEnabled:FALSE];
            [btnTemp2 setEnabled:FALSE];
        }
    }
    
    if (scrDisplay.contentOffset.x == (4*screenWidth))
    {
        UIButton *btnTemp = (UIButton *)[scrDisplay viewWithTag:205];
        UIButton *btnTemp2 = (UIButton *)[scrPage viewWithTag:106];
        
        imgDocPic.image = [info objectForKey:UIImagePickerControllerOriginalImage];
        [picker dismissViewControllerAnimated:YES completion:nil];
        
        if (![self isMandatoryFieldEmpty])
        {
            [btnTemp setEnabled:TRUE];
            [btnTemp2 setEnabled:TRUE];
        }
        else
        {
            [btnTemp setEnabled:FALSE];
            [btnTemp2 setEnabled:FALSE];
        }
    }
    
    if (scrDisplay.contentOffset.x == (5*screenWidth))
    {
        UIButton *btnTemp = (UIButton *)[scrDisplay viewWithTag:206];
//        UIButton *btnTemp2 = (UIButton *)[scrDisplay viewWithTag:107];
        
        imgDocPic2.image = [info objectForKey:UIImagePickerControllerOriginalImage];
        [picker dismissViewControllerAnimated:YES completion:nil];
        
        if (![self isMandatoryFieldEmpty])
        {
            [btnTemp setEnabled:TRUE];
//            [btnTemp2 setEnabled:TRUE];
        }
        else
        {
            [btnTemp setEnabled:FALSE];
//            [btnTemp2 setEnabled:FALSE];
        }
    }
}












#pragma mark==ACTIONS==
- (IBAction)btnBack:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)btnRegisterAction:(UIButton *)sender
{
    int tagVal = (int)sender.tag;
    float contentset = (tagVal-101)*scrDisplay.frame.size.width;
    
    [self setSelectorPosition:sender];
    
      [UIView animateWithDuration:0.5 animations:^{
          scrDisplay.contentOffset = CGPointMake(contentset, 0.0);
      }];
    switch (sender.tag)
    {
        case 101:
            break;
            
        case 102:
            break;
            
        case 103:
            break;
            
        case 104:
            break;
            
        case 105:
            break;
            
        case 106:
            break;
            
        case 107:
            break;
            
        case 108:
            break;
    }
}


- (IBAction)btnNext:(UIButton *)sender
{
    if (sender.tag == 201)
    {
        if (txtMobile.text.length!=10)
        {
            [self showAlert:@"Mobile number should contain 10 digits."];
            
        }
        else if (![self validateEmail:txtEmail.text])
        {
            [self showAlert:@"Invalid email id."];
        }
        else
        {
            UIButton *btnTemp = (UIButton *)[scrPage viewWithTag:sender.tag-99];
            [self btnRegisterAction:btnTemp];
        }
    }
    else if (sender.tag == 206)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Truck Share" message:@"Resgistration successfully completed." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [alert addAction:alertAction];
        [self.navigationController presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        UIButton *btnTemp = (UIButton *)[scrPage viewWithTag:sender.tag-99];
        [self btnRegisterAction:btnTemp];
    }
}


- (IBAction)btnCapture:(UIButton *)sender
{
    UIAlertController *actionsheet = [UIAlertController alertControllerWithTitle:@"Truck Share" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    
    imgPicker.delegate = self;
    screenNumber = scrDisplay.contentOffset.x/screenWidth;
    
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











#pragma mark==USER DEFINE METHODS===
- (void)defaultProperties
{
    for (int i=301; i<=304; i++)
    {
        UIImageView *imgTemp = (UIImageView *)[scrDisplay viewWithTag:i];
        
        imgTemp.layer.masksToBounds = YES;
        imgTemp.layer.borderWidth = 1.0;
        imgTemp.layer.cornerRadius = 5.0;
        imgTemp.layer.borderColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0].CGColor;
    }
    
    for (int i=401; i<=423; i++)
    {
        UITextField *txtTemp = (UITextField *)[scrDisplay viewWithTag:i];
        
        txtTemp.layer.masksToBounds = YES;
        txtTemp.layer.borderWidth = 1.0;
        txtTemp.layer.cornerRadius = 5.0;
        txtTemp.layer.borderColor = [UIColor colorWithRed:23.0/255.0 green:95.0/255.0 blue:199.0/255.0 alpha:1.0].CGColor;
    }
}


- (void)setSelectorPosition :(UIButton *)selectedButton
{
    [UIView animateWithDuration:0.5 animations:^{
       
        CGRect labelFrame = lblSelectorLine.frame;
        labelFrame.origin.x = selectedButton.frame.origin.x;
        labelFrame.size.width = selectedButton.frame.size.width;
        lblSelectorLine.frame = labelFrame;
    }];
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
    if (scrDisplay.contentOffset.x==0.0)
    {
        if (txtEmail.text.length==0 ||
            txtFirstName.text.length==0 ||
            txtSecondName.text.length==0 ||
            txtPassword.text.length==0 ||
            txtMobile.text.length==0)
        {
            conditionPass = YES;
        }
    }
    else if (scrDisplay.contentOffset.x==screenWidth)
    {
        for (int i=406; i<=414; i++)
        {
            UITextField *txtTemp = (UITextField *)[scrDisplay viewWithTag:i];
            if (txtTemp.text.length == 0)
            {
                conditionPass = YES;
                break;
            }
        }
    }
    else if (scrDisplay.contentOffset.x==screenWidth*3)
    {
        if (txtLicenseNumber.text.length==0 ||
            txtLicenseExpiry.text.length==0 ||
            txtLicenseIssue.text.length==0 ||
            imgProfile2.image==nil)
        {
            conditionPass = YES;
        }
    }
    else if (scrDisplay.contentOffset.x==screenWidth*4)
    {
        if (txtRegNumber.text.length==0 ||
            txtVinNumber.text.length==0 ||
            txtRegisterdState.text.length==0 ||
            imgDocPic.image==nil)
        {
            conditionPass = YES;
        }
    }
    else if (scrDisplay.contentOffset.x==screenWidth*5)
    {
        if (txtInsurProvider.text.length==0 ||
            txtPolicyNumber.text.length==0 ||
            txtDateOfExpiry.text.length==0 ||
            imgDocPic2.image==nil)
        {
            conditionPass = YES;
        }
    }
    
    return conditionPass;
}


- (BOOL) validateEmail: (NSString *) email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


- (void)showAlert :(NSString *)strMessage
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Truck Share" message:strMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:alertAction];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}


- (void)enablDisableNextbutton
{
    int tagVal = (int)scrDisplay.contentOffset.x/(int)screenWidth;
    
    UIButton *btnTemp = (UIButton *)[scrDisplay viewWithTag:tagVal+201];
    UIButton *btnTemp2 = (UIButton *)[scrPage viewWithTag:tagVal+102];

    if ([self isMandatoryFieldEmpty])
    {
        [btnTemp setEnabled:FALSE];
        [btnTemp2 setEnabled:FALSE];
    }
    else
    {
       [btnTemp setEnabled:TRUE];
        [btnTemp2 setEnabled:TRUE];
    }
}

@end
