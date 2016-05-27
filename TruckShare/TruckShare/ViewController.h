//
//  ViewController.h
//  TruckShare
//
//  Created by Indrajeet on 30/12/15.
//  Copyright © 2015 Indrajeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UITextField *txtUsername;
    IBOutlet UITextField *txtPassword;
}

- (IBAction)btnLogin:(UIButton *)sender;
- (IBAction)btnForgotPassword:(UIButton *)sender;
- (IBAction)btnRegister:(UIButton *)sender;


- (BOOL)validation;
@end

