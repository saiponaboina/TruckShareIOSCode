//
//  InsuranceViewController.h
//  TruckShare
//
//  Created by Apple on 19/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InsuranceViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    IBOutlet UITextField *txtInsurProvider;
    IBOutlet UITextField *txtPolicyNumber;
    IBOutlet UITextField *txtDateOfExpiry;
    
    IBOutlet UIImageView *imgDocPic;
    IBOutlet UIButton *btnNextOutlet;
    
    NSMutableDictionary *dictRegisDetailsTemp;
}

@property (nonatomic, retain) NSMutableDictionary *dictRegisDetails;

@end
