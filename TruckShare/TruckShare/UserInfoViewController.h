//
//  UserInfoViewController.h
//  TruckShare
//
//  Created by Apple on 13/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoViewController : UIViewController
{
    IBOutlet UIScrollView *scrPersonal;
    IBOutlet UITextField *txtFirstName;
    IBOutlet UITextField *txtSecondName;
    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtPassword;
    IBOutlet UITextField *txtConfirmPassword;
    IBOutlet UITextField *txtMobile;
    IBOutlet UIButton *btnNextOutlet;
    IBOutlet UILabel *lblHeader;
}


- (IBAction)btnNext:(UIButton *)sender;
- (IBAction)btnBack:(UIButton *)sender;


- (BOOL)checkValidation;
- (BOOL)isMandatoryFieldEmpty;
- (BOOL) validateEmail: (NSString *) email;
- (void)enablDisableNextbutton;
@end
