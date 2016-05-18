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
   
    
    screenWidth = [UIScreen mainScreen].bounds.size.width;

    lblHeader.text = @"Registration";

    
    txtTruckDimension.layer.masksToBounds = YES;
    txtTruckDimension.layer.borderColor = [UIColor blackColor].CGColor;
    txtTruckDimension.layer.borderWidth = 1.0;


    [self defaultProperties];
    [self prefersStatusBarHidden];
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated
{
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



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    scrDisplay.contentOffset = CGPointMake(screenNumber*screenWidth, scrDisplay.contentOffset.y);
   /*
    if (scrDisplay.contentOffset.x == (6*screenWidth))
    {
        UIButton *btnTemp = (UIButton *)[scrDisplay viewWithTag:207];
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
    }*/
    
    if (scrDisplay.contentOffset.x == (7*screenWidth))
    {
        UIButton *btnTemp = (UIButton *)[scrDisplay viewWithTag:208];
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
    
    float contentset = (tagVal-200)*scrDisplay.frame.size.width;
    
//    [self setSelectorPosition:sender];
    
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
    }
    
    
//    else if (sender.tag == 206)
//    {
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Truck Share" message:@"Resgistration successfully completed." preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//            [self.navigationController popViewControllerAnimated:YES];
//        }];
//        [alert addAction:alertAction];
//        [self.navigationController presentViewController:alert animated:YES completion:nil];
//    }
    else
    {
        UIButton *btnTemp = (UIButton *)[scrPage viewWithTag:sender.tag];
        [self btnRegisterAction:sender];
    }
    
    switch (sender.tag)
    {
        case 203:   lblHeader.text = @"Profile Picture";
            break;
            
        case 204:   lblHeader.text = @"Background Check Info";
            break;
            
        case 205:   lblHeader.text = @"Driver's License";
            break;
            
        case 206:   lblHeader.text = @"Truck Information";
            break;
            
        case 207:   lblHeader.text = @"Insurance Information";
            break;
            
        case 208:   lblHeader.text = @"Truck Pictures";
            break;
            
        case 209:   lblHeader.text = @"Truck Size";
            break;
            
        case 210:   lblHeader.text = @"Registration";
            break;
    }
}


- (IBAction)btnPrevious:(UIButton *)sender
{
    int tagVal = (int)sender.tag;
    float contentset = (tagVal-502)*scrDisplay.frame.size.width;
    
    [UIView animateWithDuration:0.5 animations:^{
        scrDisplay.contentOffset = CGPointMake(contentset, 0.0);
    }];

    switch (sender.tag)
    {
        case 503:   lblHeader.text = @"";
            break;
            
        case 504:   lblHeader.text = @"Registration";
            break;
            
        case 505:   lblHeader.text = @"Profile Picture";
            break;
            
        case 506:   lblHeader.text = @"Background Check Info";
            break;
            
        case 507:   lblHeader.text = @"Driver's License";
            break;
            
        case 508:   lblHeader.text = @"Truck Information";
            break;
            
        case 509:   lblHeader.text = @"Insurance Information";
            break;
            
        case 510:   lblHeader.text = @"Truck Pictures";
            break;
            
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









- (IBAction)btnselectTruckImage:(UIButton *)sender
{
    
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






- (BOOL)isMandatoryFieldEmpty
{
    BOOL conditionPass = NO;
    if (scrDisplay.contentOffset.x==screenWidth)
    {
        for (int i=406; i<=414; i++)
        {
            UITextField *txtTemp = (UITextField *)[scrDisplay viewWithTag:i];
            
            if (txtTemp.text.length == 0)
            {
                if (i!=408)
                    conditionPass = YES;
    
                break;
            }
        }
    }
//    else if (scrDisplay.contentOffset.x==screenWidth*6)
//    {
//        if (txtRegNumber.text.length==0 ||
//            txtVinNumber.text.length==0 ||
//            txtRegisterdState.text.length==0 ||
//            imgDocPic.image==nil)
//        {
//            conditionPass = YES;
//        }
//    }
    else if (scrDisplay.contentOffset.x==screenWidth*7)
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
