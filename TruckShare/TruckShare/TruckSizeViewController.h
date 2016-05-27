//
//  TruckSizeViewController.h
//  TruckShare
//
//  Created by Apple on 19/05/16.
//  Copyright © 2016 Indrajeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TruckSizeViewController : UIViewController<UITextViewDelegate,UITextFieldDelegate>
{
    IBOutlet UITextView *txtTruckDimension;
    IBOutlet UIButton *btnTruckType;
    IBOutlet UIButton *btnNextOutlet;
    IBOutlet UITextField *txtTruckType;
}

@property (nonatomic, retain) NSMutableDictionary *dictRegisDetails;

@end
