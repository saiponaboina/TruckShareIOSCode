//
//  TruckInfoViewController.h
//  TruckShare
//
//  Created by Apple on 18/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TruckInfoViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    IBOutlet UITextField *txtRegNumber;
    IBOutlet UITextField *txtVinNumber;
    IBOutlet UITextField *txtRegisterdState;
    
    IBOutlet UIImageView *imgDocPic;
    IBOutlet UIButton *btnStateSelect;
    IBOutlet UIButton *btnNextOutlet;
    IBOutlet UIView *vwStateList;
    IBOutlet UIPickerView *pkrStateList;
    
    NSArray *arrState;
    NSString *strState;
}


@property (nonatomic, retain) NSArray *arrState;

@end
