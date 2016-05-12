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
    IBOutlet UITextField *txtFirstName;
    IBOutlet UITextField *txtSecondName;
    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtPassword;
    IBOutlet UITextField *txtConfirmPassword;
    IBOutlet UITextField *txtMobile;
    
    IBOutlet UITextField *txtCardName;
    IBOutlet UITextField *txtCardNumber;
    IBOutlet UITextField *txtCardExpiry;
    IBOutlet UITextField *txtCvvCode;
    IBOutlet UITextField *txtPincode;
    IBOutlet UIScrollView *scrCreditCard;
    IBOutlet UIScrollView *scrBankInformation;
    IBOutlet UIButton *btnCreditCard;
    IBOutlet UIButton *btnRadioChecking;
    IBOutlet UIButton *btnSavingChecking;

    
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
    
    IBOutlet UIScrollView *scrPersonal;
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
- (IBAction)btnSelectCardType:(UIButton *)sender;
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
