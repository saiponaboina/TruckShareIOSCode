//
//  ForgotPasswordViewController.h
//  TruckShare
//
//  Created by Indrajeet on 04/01/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPasswordViewController : UIViewController
{
    IBOutlet UITextField *txtSignId;
}

- (IBAction)btnSend:(UIButton *)sender;


- (void)showAlert :(NSString *)strMessage;
@end
