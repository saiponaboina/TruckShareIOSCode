//
//  PaymentInfoViewController.h
//  TruckShare
//
//  Created by Apple on 13/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentInfoViewController : UIViewController
{
    IBOutlet UILabel *lblHeader;
    IBOutlet UIView *vwAreYouDriver;
    IBOutlet UITextField *txtCardName;
    IBOutlet UITextField *txtCardNumber;
    IBOutlet UITextField *txtCardExpiry;
    IBOutlet UITextField *txtCvvCode;
    IBOutlet UITextField *txtPincode;
    IBOutlet UITextField *txtAccountName;
    IBOutlet UITextField *txtBankRoutNumber;
    IBOutlet UITextField *txtBankAcNumber;
    IBOutlet UITextField *txtConfirmAcNumber;


    IBOutlet UIScrollView *scrCreditCard;
    IBOutlet UIScrollView *scrBankInformation;
    IBOutlet UIButton *btnCreditCard;
    IBOutlet UIButton *btnRadioChecking;
    IBOutlet UIButton *btnSavingChecking;
    IBOutlet UIButton *btnNextOutlet;
    
    BOOL isCreditCardValid;
}

- (IBAction)btnSelectCardType:(UIButton *)sender;
- (IBAction)btnSelectPaymentMethod:(UIButton *)sender;

@end
