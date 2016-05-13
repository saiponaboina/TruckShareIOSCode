//
//  RegisterViewController.h
//  TruckShare
//
//  Created by Indrajeet on 30/12/15.
//  Copyright © 2015 Indrajeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController<UIScrollViewDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate>
{
    IBOutlet UIScrollView *scrPage;
    IBOutlet UIScrollView *scrDisplay;
    IBOutlet UILabel *lblSelectorLine;

    


    
    IBOutlet UITextField *txtLicenseNumber;
    IBOutlet UITextField *txtLicenseExpiry;
    IBOutlet UITextField *txtLicenseIssue;
    IBOutlet UIImageView *imgProfile2;
    
    IBOutlet UITextField *txtRegNumber;
    IBOutlet UITextField *txtVinNumber;
    IBOutlet UITextField *txtRegisterdState;
    IBOutlet UIImageView *imgDocPic;

    IBOutlet UITextField *txtInsurProvider;
    IBOutlet UITextField *txtPolicyNumber;
    IBOutlet UITextField *txtDateOfExpiry;
    IBOutlet UIImageView *imgDocPic2;
    
    IBOutlet UIImageView *imgProfile1;
    
    IBOutlet UIScrollView *scrCredit;
    IBOutlet UILabel *lblHeader;
    
    IBOutlet UITextField *txtSocialSecurityNumber;
    IBOutlet UIButton *btnCheckedOutlet;
    
    IBOutlet UITextView *txtTruckDimension;
    
    
    CGFloat screenWidth;
    CGFloat screenNumber;
    BOOL showBankInfoScreen;
}

- (IBAction)btnRegisterAction:(UIButton *)sender;
- (IBAction)btnBack:(UIButton *)sender;
- (IBAction)btnNext:(UIButton *)sender;
- (IBAction)btnPrevious:(UIButton *)sender;
- (IBAction)btnCapture:(UIButton *)sender;
- (IBAction)btnSelectAgreement:(UIButton *)sender;
- (IBAction)btnselectTruckImage:(UIButton *)sender;
- (IBAction)btnSelectPaymentMethod:(UIButton *)sender;


- (void)defaultProperties;
- (void)enablDisableNextbutton;
- (void)showNextScreen :(UIButton *)btnTapped;
- (void)setSelectorPosition :(UIButton *)selectedButton;
- (void)showAlert :(NSString *)strMessage;

- (BOOL) validateEmail: (NSString *) email;
- (BOOL)isMandatoryFieldEmpty;
- (BOOL)checkValidation;
@end
