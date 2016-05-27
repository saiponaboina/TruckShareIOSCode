//
//  DriverLicenseViewController.h
//  TruckShare
//
//  Created by Apple on 16/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DriverLicenseViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    IBOutlet UITextField *txtLicenseNumber;
    IBOutlet UITextField *txtLicenseExpiry;
    IBOutlet UIButton *btnStateSelect;
    IBOutlet UIButton *btnNext;
    IBOutlet UIImageView *imgProfile2;
    IBOutlet UIView *vwStateList;
    IBOutlet UIPickerView *pkrStateList;

    NSArray *arrState;
    NSString *strState;
    NSString *strStateId;
    NSMutableDictionary *dictRegisDetailsTemp;
    
}

@property (nonatomic, retain) NSMutableDictionary *dictRegisDetails;

@end
