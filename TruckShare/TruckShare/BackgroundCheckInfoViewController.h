//
//  BackgroundCheckInfoViewController.h
//  TruckShare
//
//  Created by Apple on 16/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackgroundCheckInfoViewController : UIViewController
{
    IBOutlet UITextField *txtSocialSecurityNumber;
    IBOutlet UIButton *btnCheckedOutlet;
    IBOutlet UIButton *btnSSNOutlet;
    IBOutlet UIButton *btnNext;
}


- (IBAction)btnShowSSN:(UIButton *)sender;

@end
